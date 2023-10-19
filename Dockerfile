FROM docker.io/rust:slim

COPY . .

RUN cargo build --release

CMD ["./target/release/my_app"]