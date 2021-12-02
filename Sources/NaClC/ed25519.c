#include "ed25519.h"
#include "ge25519.h"

int modified_crypto_sign_publickey(unsigned char *pk, unsigned char *sk)
{
  sc25519 scsk;
  ge25519 gepk;

  sc25519_from32bytes(&scsk, sk);
  ge25519_scalarmult_base(&gepk, &scsk);
  ge25519_pack(pk, &gepk);

  return 0;
}
