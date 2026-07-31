Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7D42C50F
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518075; cv=pass; b=hyBqPRcmzeEpV9dWHQHyCnNEGU+bS9xTsw8ZcY3DiOYyuuf6az+S1+1Ja83Bfy6VyfFgHcpP9Ref9BoEuGrfi/Rnr63H0bk73EPZt6Q2wUxrbkjeu0a7udeNXjp8ElJobOhJDk/uy2bc0+JZ3cAethAGG14jgr/UsQ+af7T77XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518075; c=relaxed/simple;
	bh=ffngbTb7VcDss8OyQZ0TIbyICe29Rhb7o543BGHLugA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mv9xd8xuFF0UHUMyrrl/p/KcfI+LJS3OFhPv5UzKPSqTU+o7Dwt4Qlv2Na3UQrP3lUP7KRKFNO63XkWJBqLAGbqtZK+1pn/IhRtxiomoo0Ezi3gTUSMRYjvuoBShl21rsl1RyUmk4gTJFTabREMcIhe4nYZFGHHy9+/GkNNeVPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fni8KbKl; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fni8KbKl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69a19eb2e6dso571a12.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518071; cv=none;
        d=google.com; s=arc-20260327;
        b=QOMEs/n6amoKRsdaN6zNYxGrST8NfjCDM7k4YH5m/G4zbm9J6glJ9oqEKhCriYBDRe
         vy6syVSlZCbpZ9OTrNgXFL9R5s4ka2rxgxWHJ2cjJP7vuvkDR6uDBnM9wNRKJWC4n+Uj
         Kw3sjywBSQ4kdUbhCacRF3IcJkYs12IbXdOgPA9VNGyjscKvDJ38wWAbCjcegWvyQodh
         LHkNkf325SD0cQQs6JBGyA9ZcctZisGOTdj8DHg8ywSdw1IhqwlzClqllc4rLgFKeFE7
         LRiBAYz74l5STSNSSx4b/B7Ht5nO9Sfii3ibprIDrCSUPgO6FZAphn6/z63b28ozSTye
         k4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1IEjvxIxcf25OzZ9XlYmxW3nZw+p1akOleAKSM54hBk=;
        fh=NWi27JGLvj7ftLu8c4n+mEjosX4O5aF8wVR+8TpBckg=;
        b=Mb+xFffheYtsRlW87B5gIxckY2SniHsFWAb2kkb0Aseo089VZCiiv9yF//X26lcVu7
         QzYU7JUU+b300y4fvCRgCMnlA50CU2eCnR2JbsNMGnFLdfcBAyIbEMZXBhVdyeOyUcwR
         j3ZG1gi58Ap4BaUW5E2xWqzyJz3qkrl9/TykLfKS2CnyBsVxpnIrRFcuj0KqeW/EXP1p
         nRkKqMkbpz0Ts8RQZcfcEzjd/2BicFP1bOMRjD3giBejxMaIV0gbRjlKxUywF/hRT2iz
         HticoJr6/Ts8GsQDCujmamvMWORVeadnwG44dNCZYt4M3paFZ8y6Bm/DyFMoWX56mwBF
         Huyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785518071; x=1786122871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1IEjvxIxcf25OzZ9XlYmxW3nZw+p1akOleAKSM54hBk=;
        b=Fni8KbKlLBw2IOxA0RONt692zF0OCdq2s477p4WMfaM20/wr7HKkohBG8CnJWOlmlF
         GHpxGge9dQIMobk6QOjz6VoiH+lzbBBDz1HGkzFAqaVV8rDW68bUPjR3z8o1QaJpbYNh
         g5vxh7NXHn3dx1/drxTwfzPY6KtNFoFRBA55b1oAfImkqjIJlEeeYZy3IhR/1HUJxpPw
         CSkFyixPaOO01U3Q9Os0MYfbNdzqU2nzg8hRKVCMyPlEqGI0h4LxH8UGaHtejPXpn4so
         Jcihh0paUm4iLm9w83aDyo3csHFs11CCy++2SG8a1eHVXsqY9QobX5qCw2sgNJMyZ42V
         RoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518071; x=1786122871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IEjvxIxcf25OzZ9XlYmxW3nZw+p1akOleAKSM54hBk=;
        b=huIUGgPVbx8xLDGP4Mt47vOt6rqn3m9ujB01Bm9wzPeaj9uvdwg75qw1EPUyZsOH3b
         2b30errNta4cstqh6wHbz9vNZG4cmvvoePi9ZN74M4a6G4tq2xYNp/By5CDOBW/SaXtv
         ubYVClLhA+JS1F+6sc4im+MkWbfz4dmCsF8F9JNvrAutVB2pQyr0R8ZYCknaZwJX0xgV
         MJ9Y5J+ETTnC6gw27jzyJg6s5FRiYLag94OKYjysJ8PNBYwLIzOKM/jL+BwqkKgi/eZ3
         WRcivpVolwJLRkh/cdtm5T6Rg5uV00qhkcjjPwlXnZMZVbvpp0i1mQtT+TQ8YKa9soaw
         nBNg==
X-Forwarded-Encrypted: i=1; AHgh+RpWrJiryXljXOOkt82CrAO4CC98YYBbUutTyPrvg2BpDo4m475UUXkuPYy18a7vE5qHb8KtfmJQG0/x3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfgpPI5N0sJWbZMsWVnbhCm06oajwBivnRkRsVfTnDnfkmE4J
	yhNDp6Kz3kHR9S7oG5XDADmDyMXNy+AMprBeifNPlrpzCqJq6UWv2ALkXDABms3b6nfR7cV7rh5
	YnxqjzkQPa9qRHAOzkXrOd0moW2wHhP142ZsQewbV
X-Gm-Gg: AR+sD11HRsES9El0zcYIObqT+nYcfppZYlmzjSl1Yl4VJx+//G8mPQXqVkv7EBDTpa1
	qKZehXU+5IOhReJxOltTgp3mebk00vQ1IBG2UbzrLfYw9yMAD+RD9J/Xl27PlvRkIkG6P8anLTr
	3vl4W4ScGZW/rDHFAVhLABKeoYlobN4LbC8BegQMTqYm3pgQd3c57pCn7L4p6l/pGkecpv3QJV8
	kEcQwpqbLfjaExQuWt4fUW9ZKDaoySvsx/ZNZgzFbpRbCjuwb12Kh6iOvcNxP802j0BZllY3IBf
	u0/5m58uB4DL8TXfe6qFoI3uE4GcWHnhF7h9uNgFC+PZOD2W9q9ve37OCunEk06fgVC6T+s1Qdg
	=
X-Received: by 2002:a05:6402:29a:b0:69f:d9cd:ec41 with SMTP id
 4fb4d7f45d1cf-6a0a84fb211mr2629a12.6.1785518070065; Fri, 31 Jul 2026 10:14:30
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
 <20260730062645.233148-1-shoubaineng@gmail.com> <20260730062645.233148-4-shoubaineng@gmail.com>
In-Reply-To: <20260730062645.233148-4-shoubaineng@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 31 Jul 2026 10:14:17 -0700
X-Gm-Features: AUfX_mzp9OFlht_i5txZ0xvAxi8mLSvD5KWIdtBZewXay8clz2l69cTX7T1s68U
Message-ID: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] drm/prime: use dma_buf_fd_install() to preserve
 export tracing
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:27=E2=80=AFPM Baineng Shou <shoubaineng@gmail.co=
m> wrote:
>
> drm_gem_prime_handle_to_fd() open-codes fd reservation and install
> using get_unused_fd_flags() + fd_install() directly.  This bypasses
> the DMA_BUF_TRACE() call that dma_buf_fd() emits, so observability
> tools relying on the trace_dma_buf_fd tracepoint silently miss all
> DRM PRIME exports.
>
> Replace the bare fd_install() with dma_buf_fd_install(), which wraps
> fd_install() together with DMA_BUF_TRACE(), restoring full tracepoint
> coverage.  No functional change; the fd lifecycle (get_unused_fd_flags
> =E2=86=92 work =E2=86=92 install) is already correct.
>
> Note: this patch depends on dma_buf_fd_install() introduced in
> "dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"
> [1].
>
> [1] https://lore.kernel.org/dri-devel/20260714114654.3885457-2-shoubainen=
g@gmail.com/
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/gpu/drm/drm_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 9b44c78cd77f..fe3436d1235d 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -524,7 +524,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev=
,
>                 return PTR_ERR(dmabuf);
>         }
>
> -       fd_install(fd, dmabuf->file);
> +       dma_buf_fd_install(dmabuf, fd);
>         *prime_fd =3D fd;
>         return 0;
>  }
> --
> 2.34.1
>
