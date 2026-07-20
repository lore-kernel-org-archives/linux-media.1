Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C9642A80
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582159; cv=pass; b=CdUR6FA18uv05GA6I7xArkJdzqzwwj6qwe4PANxZujjgkz/xR30lup+qDjv4DhDgimrJGrnCu9h+yhFkMZnTPZuIppeKxUWe05SE5DzadloqAoZMw6mDaJnI2MEt87BKL1UGflA78gZcjrqApIF8SRN6X/B7zmFwjYgk8Gi9DSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582159; c=relaxed/simple;
	bh=GYmozcAMwSemNlmhz+B3xhx2TrSFNt5xSE7k56r5ovg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5eKq4h4kpIpRjhsCnxEbajBY2WAmd++2kNld56O7OXOfqM82dgQe5z9+BIQlvupiMx0E0/VmBFYvzLNHrgyVD01lRw+xYpVr6M0OoO7cov7N9IDGN+cIVuvDwhuRIrND4622KlOYDyQkQgfdrF/1C5wj2+J5WwPa4Mec4nhJDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F5hO0hcB; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F5hO0hcB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab97c86bdso454155ad.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784582158; cv=none;
        d=google.com; s=arc-20260327;
        b=N2hd8bkrvQWsgqOal49ZmHiT+X85WswDpc8T1dO6Y7s6P8VMRQLRfuWxa/bHCcyAC0
         j8G6WwUQ0W5VRstwGvk9HIWnNnFRH0/5RKhonP+R6s2ON59THCWe3HoBjR6jEm7EDOIM
         bSjUBAIeRep8HviLCrkyXwz9bU6fDckyvYZJK/1uSiB9uSnT7Inca4fo1YjOV4a6eqnI
         dbtJac8s4nZsw7C/LbQXkQ1XblmFoiaTrDooV30kCc5v/ahbM2gIzz7YvgbMDLdlY6/7
         yi5TjluY0Cy1G0y/4gdAI/HvFFo3MEUbfStTkc5oDjgftVW86g8Jj+CHgA+bhMprzSpd
         GFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUz90BaUvuUhSt2RwJPSmjEfCptOlPXUUGIO067pPsI=;
        fh=Ei8eAvE6Wnz7iCP4nxI4PH08u4jUvYIzEoXrD5ECOZw=;
        b=rR+P/btK+iuzTSGgE4SA5iVWh1X7oKmUCNGWNTj9uEXsZVEuYNxxc+V5luzsJ2Koq+
         xbrxglsviU3/Ek2OnTkqbmGDx9F7tiD0yFeIiumouz+IJu6JVVbq4GfQwI8AonVTqUBg
         sfc/bKyugMPPznTZkoo+yJyUh3Ub1+8j9DELaPuU9WyZu7lA74Hle25CQg02aq0Z1zJ1
         7uvrSIUqShb5QM8psAqnXLO6+k1x1n70W4BWyGmIuJdmSNOFNfDhZ8FLyU6I5+6mOMzZ
         +8ZLwcX2tCZ9QCEeLF2xlcCt8JtzrAI3Q6i6Kb6L7CPUS9VlPBUoC3Q9X/s4b788l3LM
         8gfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784582158; x=1785186958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUz90BaUvuUhSt2RwJPSmjEfCptOlPXUUGIO067pPsI=;
        b=F5hO0hcBNHdKGk9M59qXB0EfAf1ZQL0kiD2GIokeaFPVUU7JE0sBVMIOaHAJJlbqf1
         hT0EOsaGQxdzfkSQxV5SGVl+QdL5b6YSb2ZjQcZcLVNAPL1/8wIsNcH96dHr/vpiGqUG
         I/27/r9cfrp5Ztsp3RVhurZRlE2qZSv42m69MWpB8o09v5sRx2Rp61wKfeDuQt8qOgV/
         5Npk2kIQYLRLDeexi5vPRbcgEYHVubzyoIEQIKsfg75YWhiyH8NwE+Gc22p4+NDE9kWL
         Kq02Bv1RfaF6OK4XicyN5ZimBBBuQoKC7Cd85xPJt3ndaYNSfPVYjdP+YdCYZm6nh5OX
         79lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582158; x=1785186958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUz90BaUvuUhSt2RwJPSmjEfCptOlPXUUGIO067pPsI=;
        b=dy1uNnoafp56MaYXFeo+rHZY6+LDLo7RJfpTQdlOq/Ld45t4OP6ajrqIBT3S33pbHp
         6OAzZq0YbCzIrPGkeDp93aMd4wIExRVnAqS9A4Ftz0QUSiz19Kvkz9y3nSMSdxME1duw
         jcHWeHmpN5Wt6GfdfhX/yCvMR+pbEgWnORqSGsPtrFmwCUwuEIDQmZXrdB0Mi/SRHPC/
         LWKN7fBJOKPJ++3ePpp0CtQLvMMJYW+YIxHWODqANyoJM0sTArNd8cXHvbugW75Kgxyw
         HqShCr/jIfJOKe2/GjD2gw31Q9jYJXvx0qbb3kdAJn1q0mJaa5tpBjGTGIme413YNrbl
         RcYA==
X-Forwarded-Encrypted: i=1; AHgh+RroS4F18tsCfy+yY6fGihmhhhML5DacycbvJImzizlTuLgqR0y+1XpcQ3olATonZuq333in/TGIe/ldeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVF8ISCtF29WsTAlFcAMJl66CtnhMm+pRPI83pSlTDDxmljKo
	U3krOjrwo3fZDztzMt+nAbjKCiyfU/rIscOuqZggGxlFL5Veci17a44uLjZ1QjDvL+mP3yWFCVO
	KEXeWIbW5RS1HQMgUmvz5EvTV7uNrK0+2kD/2bN7C
X-Gm-Gg: AR+sD132LrJdoduiLhaR0cYEbrb+IUXQbYpkdLGjvxIkKfvMJVSic30f0Vghcia61k+
	VelMeU9OaqvTjaQpQ/H85GgtS0VgSWYYJ9TDu62p/XyT9SeQeZtJUHFfq94DxrHVSAjvHeeTXtQ
	xG2o0GSRfuojklkB/9qpxIs/Am3nVFyjeTbWD6VXSF4c4WME4Lqp5BUmHBSled6AjMwSAUOW02J
	RN9trt5Rc6oLwiuo4xjYepyBYDccOYD6D+CvVaCDgZXdT5WpuTQm+eQpR9v0prqCiw1s7WqK3Zn
	ODs5N4StqTso3ChHIhr3tZcu/lM=
X-Received: by 2002:a17:902:f54c:b0:2ce:7ae6:2a23 with SMTP id
 d9443c01a7336-2cf7b702c3dmr2558895ad.27.1784582156890; Mon, 20 Jul 2026
 14:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com> <20260708-tcpdm-large-niovs-v5-2-34bf6fac941b@meta.com>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-2-34bf6fac941b@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 20 Jul 2026 14:15:42 -0700
X-Gm-Features: AUfX_mxUXqtSIB0dpGSWPZIOzVEGjkP0LeV9jHf6fDBCDwwRrEGRR9CjBBihAPw
Message-ID: <CAHS8izMz_S8K80EXn3oFXiDNkGuPUMzjecaJjAvaZVky-7O40Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
	sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk, 
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:55=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail.=
com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>


> ---
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++=
++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/te=
sting/selftests/drivers/net/hw/ncdevmem.c
> index d96e8a3b5a65..a16e55af51ee 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -40,6 +40,7 @@
>
>  #include <linux/uio.h>
>  #include <stdarg.h>
> +#include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <unistd.h>
> @@ -61,6 +62,7 @@
>  #include <sys/time.h>
>
>  #include <linux/memfd.h>
> +#include <sys/param.h>
>  #include <linux/dma-buf.h>
>  #include <linux/errqueue.h>
>  #include <linux/udmabuf.h>
> @@ -79,6 +81,7 @@
>  #define PAGE_SHIFT 12
>  #define TEST_PREFIX "ncdevmem"
>  #define NUM_PAGES 16000
> +#define MB(x) ((x) << 20)
>
>  #ifndef MSG_SOCK_DEVMEM
>  #define MSG_SOCK_DEVMEM 0x2000000
> @@ -100,6 +103,7 @@ static unsigned int dmabuf_id;
>  static uint32_t tx_dmabuf_id;
>  static int waittime_ms =3D 500;
>  static bool fail_on_linear;
> +static uint32_t rx_buf_size;
>
>  /* System state loaded by current_config_load() */
>  #define MAX_FLOWS      8
> @@ -142,6 +146,7 @@ static struct memory_buffer *udmabuf_alloc(size_t siz=
e)
>  {
>         struct udmabuf_create create;
>         struct memory_buffer *ctx;
> +       unsigned int memfd_flags;
>         int ret;
>
>         ctx =3D malloc(sizeof(*ctx));
> @@ -156,9 +161,14 @@ static struct memory_buffer *udmabuf_alloc(size_t si=
ze)
>                 goto err_free_ctx;
>         }
>
> -       ctx->memfd =3D memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> +       memfd_flags =3D MFD_ALLOW_SEALING;
> +       if (rx_buf_size > getpagesize())
> +               memfd_flags |=3D MFD_HUGETLB | MFD_HUGE_2MB;
> +

The fact that you are using HUGETLM and 2MB mappings here made me
realize there is a pathological edge case in the code where the netmem
size you're requesting is greater than the mapping size, so you
actually get no netmems. So like if you ask for a 64KB netmem size but
actually you did a normal udambuf mapping and all the maps (sg len
entries) are 4K or something. IDK if the code already handles this
well with an error or what not. Worth checking.

--
Thanks,
Mina
