Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CB32B13F
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428290; cv=pass; b=kgr5GmdvGemw7TdkCnp7UoTU7tHB7uztUGXuuJ/aq6H7ibS8qLFC4YxbGpMtG+E9OhpBiqY0BG9VcE0xp95t8oElzxVZYb0s3TuxevdHEWgsTphahV1KpEYZ+WjZ7/y2VcrhTFez/TQYYk81FruOEPOdTTWmO7ksZUKOxO+AChM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428290; c=relaxed/simple;
	bh=ADTcopVlADt5HZgdX2+W3mZxGsC6Nw/f4SA2C2AyzNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPTwHIbkBZ+MfjYnPoWJIoSR05237MrUi5oNOC81+I2ZZACho+dLmITIg5HeNVFR6FOXqbfQPopzitv8sgHMAnCx6X+3hua6NmSuTI5xJM8zMU/GdX98HdPGAAUZzmg1Fw0QOEkHWsiKui58VRAIzBJy3qGtzJ1s+TK3lwvYbHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxpsnN3d; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxpsnN3d"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso9425e9.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 16:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789428287; cv=none;
        d=google.com; s=arc-20260327;
        b=DpQJafyKQl1du7ufzT8ux+361hj3AKY9XmLIb1dQVgzOtwHtsnbgs9fTgT4OvkccrQ
         Q/9ITcs4/8RO1VVurCnmtN4HzL/cj8A2DB7YwtH60qAKbq0UBv2VbN1edicpY5fa89rH
         u2kWUwOBiW/YK6hh+dWMYMcDsqgPFt8k/dz6q0pNo8nEicCvFnxnoWnYod7zyBHcIQWR
         In3Mxi7Khg3p8qnQzLqRYnT+TuW8nEHBRyEeRqHVmidJzM4veyjcKrWHd5CTvKrZXPUJ
         WWZgmMUDCLnl3OBAT5Q3OSO6EMZwyqcIDwbCT4xoBp37JGlB4zfg1VPXJchUjPc2Pyzf
         4ezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADTcopVlADt5HZgdX2+W3mZxGsC6Nw/f4SA2C2AyzNY=;
        fh=oU0hXSw5q4wKZ276K45eqZ6nU2548pYqc8axoLzWLhc=;
        b=bcTmQ4yO3f1qbsw9FlvKtj0jNswZiJ5wrezhFj90nvDa/rLxpKuZurESBRPnbS4yDN
         Xm9GVw1N7EUWHmWbUAiGfKzmoT0diEzPhyy5085IB6wpObWRNZt3mfv+34rgYG7j13cF
         i9JSjuPM5b2pNruEpWRIjMr/dDzeBOkvP/PVaa9Sn7MnSf1+JBVJtj2/5nVngY1VDoSN
         j/oN+MDVCzOdbFaZie1sfaQ5g0g4aow47Jn0fefCHY/RxcagNL8vPI649aWoOuKmpT9M
         qpju3NXSqmpTdz0Mcize8QAdO+rgwLEKkvnLmMw1TYpIhqOQ0pzEbEGApuOIVdlyYuGQ
         Rk+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789428287; x=1790033087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADTcopVlADt5HZgdX2+W3mZxGsC6Nw/f4SA2C2AyzNY=;
        b=pxpsnN3dLd9+KFdJzbVkREK3EKA+wzvKeqzAf/ovHpZVtxtOzZFM/aEtMEYnyLhnnj
         sPznqa2oC+jPoyg1fIOFCHzrczEXU7lmjOxNeO2Tqqiwl8jqEAgdsOZzaCuitcUWTfnS
         ipxNO/r6W/oir536qerFL/plCSqZOaTIz9ZS9thnUd71ny/EARTtib8qEjbPVVDECNj1
         eCcqTFMvATMcTAAPBkFRcvsURHpXSG8sSlRYU9aOHD01tiOgXWV4WG9247O1XmhWhUzN
         fZLJftESq8XwAvRdoEsL2qGkWjCWTJFy0Ygh/T2LHS65i6ilE0+6EiTHNeaDXlkS4gM5
         3tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789428287; x=1790033087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADTcopVlADt5HZgdX2+W3mZxGsC6Nw/f4SA2C2AyzNY=;
        b=Tl5xJW+RiTirAtP836JpOIGrh1+GlgxLTiqBdoJczAQLjNMY0sIzoaGRqtjC1k5Iw7
         PvoVZQ0kmYRkQ/kmoWwAOKcXv0BMMxxKKSJkKEZ7XRina+38MsxkDjOJhIqlrU6P7A52
         RiWBY3xjVslTVCF9UQczq03d77C+RO4B8VWP3xw0A1qhTHPmIurd+kFGi+WhHpssBfOX
         ePmjlrSa+OR/ewUcUCW7JcjaQ/4NMJTCjF4kVnYtyXyOpzsn4ev7eca9bQSCP2IdCDL0
         J0L+idHJPDYH9h5TAbD2dTR/+xpD3wOwansXA5JJrprEUFrKeXJNgOruQKTlI8In8RnO
         YsBA==
X-Forwarded-Encrypted: i=1; AKwUvBxmL2L1EwLEcZjVp+VQf1AFk+T88/NuJqkUgE6gcnkfp8YHK1/dJTMKAmLZukXZjvenKuRROUlTmZ2XhQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m3to/wjyiedgChVpzEjdBAQYvqQJxM2nJWyQ4FZWZlXLXopU1w
	MuY/YZEw3KIrQ0rJBlGhflljAAphNBHUeVJg7Djv2UjposbAq8CouJCG17OpN1M0+fFZFd050/W
	HPpg+S6La8wvVOIBHM37Ut7zw/PRzbkpxvwhhz6Lf
X-Gm-Gg: AYBFou21qMnsplA6Al7IL1DwNj/GbyAHN+3iFZzgn+0uwXr3It/L9espeUseBzRB9mf
	I7TgDXVwRuxkmVobA8GfbtgngoyfIBYwvPyRsiMwkObKLahF3ekNzdBZnALIxfQZHMsE/FC86Pm
	U1/Z1DRzgJO/dMJbhCpIJ3AVLTegIY3KeE3j7xbG8fenRKjerCEDbitBmAv6TzZEP1JyBAJh6xH
	/jxq2fUhxQZZY0zGadLMWKwlJSDMQj+NjYuSJ6STNSlieDoLoUlZC/olwcQSXuhiGMFjB9eg0gI
	f2TEYoMQbevCpwCQGaeJoxKQUcigUdMS1VT2RYh6VSMs5b1Hu59K0LSI8aVGjuDewxT9ydwVe/P
	gTuG7tvAaONQ=
X-Received: by 2002:a05:600c:e557:20b0:49e:65c4:5539 with SMTP id
 5b1f17b1804b1-49e7dc07e43mr198835e9.6.1789428286617; Mon, 14 Sep 2026
 16:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-4-dave@stgolabs.net>
In-Reply-To: <20260914212258.2657788-4-dave@stgolabs.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 14 Sep 2026 16:24:33 -0700
X-Gm-Features: AcwNN1XvdVkxpYJKs11G2gw4pWvKxZyOLnux19FqWp7h1UxId6mm21NmbJI9MZk
Message-ID: <CABdmKX36Nc+3BV7e+m0eOu5CvobtO5iL40MbfWXxA_eJ4zmWzQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: validate the attachment before asserting its
 reservation lock
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:23=E2=80=AFPM Davidlohr Bueso <dave@stgolabs.net>=
 wrote:
>
> dma_buf_phys_vec_to_sgt() asserts the reservation lock before its
> NULL checks run. Validate first, then assert.
>
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping=
 routine")
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
