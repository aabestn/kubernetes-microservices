# Stage 1: Build operator
FROM golang:1.22-alpine AS builder

WORKDIR /workspace

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -o manager cmd/operator/main.go

# Stage 2: Distroless Minimal Image
FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /

COPY --from=builder /workspace/manager /manager

USER 65532:65532

ENTRYPOINT ["/manager"]