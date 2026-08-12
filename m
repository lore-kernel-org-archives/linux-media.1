Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1738646AF2D
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546947; cv=pass; b=j/3DOrZO3RXVmY+1w1cgrlqWNfNoykbXpq3R1TibuzgZvEeEGqXDQhIpHC9FXqB3BNBoTcd7nivghbAMj2V2i0JlYLMoxmqmxUoM+nrV1KMon8kt8BCBNaB9Ebff5olJ/2hSgQeSgOr3DmjYPlNgVncE6Bbs27DybuSvoyjUaZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546947; c=relaxed/simple;
	bh=dXagVN0/kmU6TCjEQGzKhj+CDaoiXU32QOBD/KQk5sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piUSP6mOfRBXEa4uAequjfBzQxaKgTSqCakISiYlJ5kx3QQv9kcQFHOUeLoDnBAZH5jeA9yyizxv0ToCUyjrrrmYIUr5LenxPodmnGa7E5ZjtotWUmIee9ACYO9pnBEW2iwAjD9FL/QmoqgZvMTnJnumu48qalSJ52sZawsQ3S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFsTbeWm; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFsTbeWm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so104636366b.0
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 08:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786546935; cv=none;
        d=google.com; s=arc-20260327;
        b=GRTqGf82zRsWRmkuwYm/xgyEvuT8VqAlaRwO96Pm5D1I3mazU2qFZic0JnFLCfK7ye
         O1JZ/X3P5lyOUZ5ZTNMzynPOeoVH+UXvQWP4NDDsVCuyduwuB5pn8GRE2JXUA36/xU4f
         u4gYTWULbt2em6r3coRO9UKUeAkE+I9F78ncYSZ32i8qBV+2CNFt7Ux0fdAX4MVw8NXf
         W+QHthczGXfmmBSUSiG0g7Ko8DEbxYBsIJV2RHVgL2h39miXPdBlWf+ZPNTeJWKre2An
         qVlcQhCd0lk9M+T5N/yf4QnAAHNUp/8j0I3zVDS9yan0PA8Bzq6guUXqBHgs6L8x7zQ6
         RPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q5uEzbGEkmct8ZKXCwDqoN9egKEIy/PFu90SVjOVj20=;
        fh=Bna1NIaMddkBtiiHsZyLtKu0zLVqk6Y/dF5DHFFILcc=;
        b=sqpLxk93bqTE2/ph3zYVf0UoH/eAYd4G1+/a4wkAPGNcqVAhl3jtkqyLFSDCPPklph
         5Crh7qTeZFHTyBvgoszKljogParo/V7qp7M60mPoB7pLu505tTA+ttb4TEhUNI7yyXgB
         zgEWaazh2Rj9wMFqj3msoANwvbHxasQGVmP3sNmFzhcKJ6LZMAnAYYPthCmV/l86xzIX
         2n1vj9uJnNYQ1x1WGOq7+eQXZM+8LE6TRKzQtxQA+ADmV/WhF8m89q4fHdOIdr7s6JEm
         HosCMl6L/GRMxIejqgc8pgoWxfnmTAhjFyK6tMk1sYUKDBUEHVUgHUg4jFf5bpPE18eD
         H25g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786546935; x=1787151735; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5uEzbGEkmct8ZKXCwDqoN9egKEIy/PFu90SVjOVj20=;
        b=vFsTbeWmT20H1Il3YQ0XWizui8UFdv2WwgedM2qieXWbIuTCtzgjrL6oNEhBsuIzrW
         sSVIX7zn2leQi9N7uE4eWOrln3hyM4BM519t82pztbAyTnD0W1nsn2+9SryTvDfX+xZA
         h7sIv8O44gx0yWyL60E9NpNQG2ZONQfstyEAd5z3Le/nQcuruRfXVaL5u6vuA+cZXa9F
         2KEGAc3UryGbBNLZJWsjPUJGjrlWiX0/ftGXqNiD4d+4yO4IxOqgbZdx2blwRjUBG4GJ
         1ECiBRojNWx5XT7I0puQMWob+ZYgSDnY68Mp8heCNtmEiCsFbAb2mYnRqPRox09aMOus
         WLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546935; x=1787151735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5uEzbGEkmct8ZKXCwDqoN9egKEIy/PFu90SVjOVj20=;
        b=jpWg9NO0kb2Zl9/+9/925mZ5W6XtYuFWjQDW3PaZAbzVmfCry7hI5Exo3Ew/jpuica
         byxhH80uqn/QTf+8DcKvukIGTIXs0IvgDZKrWJ+RHRq6/6cEgSSfy5SJA6F0iiGbIAbd
         e1at5Kc7DsS5JKC0IAOEpdcHNhlIEB5EbTIoKUp6VWLgY4dqn2L1XzNqkB+DYv3LtVpz
         j8ElTImB2esjMIx90W2AzlmnwsYM9Sak03jmcCntUGieI5El3umHzXNFrT2AYyWgtQ8R
         hn6+zM5P1LmZXJTKPZdV/KByBWPpgGqRWLh9WUQ0D2YSPeh2T16gTiio/xrADqT/Ip+z
         L/wg==
X-Forwarded-Encrypted: i=1; AHgh+RpqurQ3kRGc/MBisiyVyNAvWcx0CBCji2BHlpR/wrVczJYHBY6iC97TjAru9jL1zuHp7eSxTPBO/+nWBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsBRuejqni4h86lmdf4dyG8jyjShAUG6KeeLZW1OSjcyaEBJg
	Mc6eaBIPT2JWkaemG/yzJiXBEwH9TKw0S+z/2WRDKo7auznhzT5NRUfOV4v3vabEJs+zTDMsVqh
	b1jRhdDL2XfAHWVZ3hePFwr+yhWwElnXY5BOUWIzllw==
X-Gm-Gg: AR+sD13czxzya5wCusZaDU7vArV4JJUdy+BkYvq/Prvdx69Hzbs6sELha5d6oLBAsgU
	TLyb+B3LSwW9EqzNb5Xg5MZl/KLLiu93fMzIkcx32JFzwAEBEBRra/Jtyf8fhzl1WBp1915c41A
	9SdNb2o8KXY+3/EuEFOAqvGoNaBa7xjf20m6qxEj/46p6/1v67MITRrv/en1SLd56N3yKx8J+p0
	KH9N/T0VzpMGFX7Rj0KuRL2EBZjzuMpVkKOz0i2Ix8YXO/P+++7DB5Wd69b/tbWq605F4MujQA3
	iHF34ebAMtMheu/qH4mAMnqiY/5ExJ9kbsXecxtxCdcAFd1LORE2bX/A358Y/brKB8EpsTlC5Q=
	=
X-Received: by 2002:a17:907:980b:b0:c12:9b98:209e with SMTP id
 a640c23a62f3a-c20f300e2c3mr249056166b.23.1786546934618; Wed, 12 Aug 2026
 08:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
In-Reply-To: <20260811204123.3198370-1-tjmercier@google.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 12 Aug 2026 20:32:02 +0530
X-Gm-Features: AUfX_mxNO1BArOhzalHmBpnvLYxDFW9EBmuDhA91cv0HkIInUfoU4eE504H7mhY
Message-ID: <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: "T.J. Mercier" <tjmercier@google.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello T J,

On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote:
>
> Write permissions on the /dev/dma_heap/* device files are not required
> to issue ioctls and allocate dmabufs. Applications should be opening
> these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> this. [1]
>
> Users are pointing to these selftests as examples of how use dmabuf,
> and encountering permission errors on systems where write permissions
> are not available on /dev/dma_heap/*. Apply the principle of least
> privilege to selftests which open dmabuf heaps by removing the write
> access mode and using O_RDONLY for the open() instead.

Thanks for the patch.
>
> The same is true for the vgem test using /dev/dri/card.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=v7.1#n49
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> index fc9694fc4e89..45b420e37c97 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -48,7 +48,7 @@ static int open_vgem(void)
>
>                 snprintf(name, 80, "%s%u", drmstr, i);
>
> -               fd = open(name, O_RDWR);
> +               fd = open(name, O_RDONLY);
>                 if (fd < 0)
>                         continue;
>
> @@ -96,7 +96,7 @@ static int dmabuf_heap_open(char *name)
>         if (ret < 0)
>                 ksft_exit_fail_msg("snprintf failed! %d\n", ret);
>
> -       fd = open(buf, O_RDWR);
> +       fd = open(buf, O_RDONLY);
>         if (fd < 0)
>                 ksft_exit_fail_msg("open %s failed: %s\n", buf, strerror(errno));
>
>
> base-commit: 9a11db68872055e6ead919bad04d6330851c522d
> --
> 2.55.0.679.g6767b8d81c-goog
>
