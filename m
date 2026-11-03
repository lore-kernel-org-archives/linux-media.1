Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723062;
	b=eFDSXZbMgFYJuFEnk8aYqdjvlpL9WZHFphSlZlU7aP6fwQyrGr8ZZncZxiJvRLXGKuIR
	 fIow9WXq0A02O+3Dk3BDlE3bTHllhnRy2YjmIdveWr6bD55Ud4bHzpKvMsiTx1zwYCEZl
	 T2gctBSRbNrhIAh2a8cYFGvpwL7A+NPW27YUzKTYzgy130cncRsJ5YNbRPeHPsuKfFlLL
	 LzmxVDNhMTW1ptyZdOdYQQ9wHhk0oNOczUMLeuewrSHk7m9qGxpRoKZKMih3R5jKiNN+M
	 VZ8xnUXKtepavU/l1css1z+6ErYmMTFdtiCHsJZ1pQeIT3IvEyHxqXMi4ugejgUlSzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
	b=yVKnUdzFBBzxtTSiTBczm1IDNNc0OqK6bAv7LF11LckRJNOLrIPwNBpNzwdm+hya48PA
	 iAnrQ0O5bSJ46hMg07L8ifWTuNuxG7DtnF4hbljgOzVNIsyruyP2sItIfC6cI6QzcBddq
	 A4eRHlnRhR1rOVvNiM8jccfIe1uxsv+Uq5Hm/vbarnaaaePI3ItVTToobBnxFN/nL2E5t
	 aZaTFHpRuNfnxG5o4/kxb0eoR21QrcApqjOMFN1n73DXF1XYD+l59fj8TV5boO/O4SekT
	 PdFN7nY1E8WAy4Gg4noW8Pk4OlMkt3P4XqvIbOkzx01IVxDOnzJCKyd2uUDdHkA8AZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyQwWXPa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF856606A332
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF856606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyQwWXPa
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018493d57so70545e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 08:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723060; cv=none;
        d=google.com; s=arc-20260327;
        b=rAa5jP7ZpiebETiab5mlF9dIK62O9YBqVMUwB5mcC8fX2BXY339hm7VXPBrr/OPoW3
         nVkkPzrrqOoByCmGv6VX59mZWYqWmM4nG+gx4UBhzoXZmA3sA7Fpd9kEgs4plAQBeG2V
         PxN/NG9H4xkD+vz5qq999e2J1yKkv/8WFG1Cqi0+a5MzJ19f+jKglk4WDXLdv9pcrW1X
         +/ZYAp2FkSTs2xucbBuIf5h4ypnDb7wxjzyH2XEUbu6LPXfmi/Ea7hrLsgCXCCPnEGku
         sLOElFgrXAAc2pdYCv5mmPz2whbrPrBhW81cqmRyu0DL2js/SmyHZpz4MublGHCInQWM
         x9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        fh=Hzfn6sPaDaVFrX90JmSDO1BjXxQ4N76xIwxGMRssfUw=;
        b=rFIlpHDl9//FBFFhdORXwl2pHQk2bmuCBFMGhMQoWLGiwYC2OirEiSRc5ScCLu0Qv+
         MYg/cgc3Byw/t0zkiFtbiqxzwdGNmqCZi6U91Q7STwdwIK/tO+RydlIgfM1aPcdKc27n
         mcqaM27DGVuv54NkAttlOO9iMfk425ZAF8zemMOnkJmZ3QA8ieZoTQpO+eQo1zW6jBNv
         dxZEOlMQaAM7RWEMNFKalBKMVUmVvXTuQrf9KtDlXflZCQr0RB89aVRjDDgiE/YxgV9h
         0buauK/rX65uBJnu3p5bc0pL7QtsRu58FJV/t34Fh5ukY4iDGhQv6SZck3VL1zASZDmD
         8Rsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723060; x=1794327860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        b=gyQwWXPakqNPqfLYpECPqP6kIovu0Rno6xf9dsy6UzX8gWi245sCaxZa/cASDVGW+J
         u0Sphg57Zh/hS9iwpMru/kTgY4p2YWrbrjOSDbwjweKZa/kzCWwdk3quGrintQuo4Taw
         bm7ZbWvvsGfiz/7tjXeFRZGCOUT7z2vERL07JW7OAhvGY7E9CwOF8ORk5D3Ni6GSO4p5
         QsJkYuDyBI5XRQqzd2SuOJkRpwJvbqNF5yHEXrGOJk994AEhZtn+eXpBlmtZxeAJ5jJT
         VQgPhac+bIdKj/k/+OPjoAWglWwq+xHwqmEvt06Rve98YDSDzI77rOQtSJ7coUAYHNjw
         JaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723060; x=1794327860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        b=jugIZ93/qoBY3Rn8R4Y/0gKsMiEy0hI9+ixi0ZrTO6AmyKIBsUtCxvWV3jcoOFNsRF
         1kzE10NhpGLc+7SkrC4D8wivTKzibgGL4Mqvvkqv+yoRndlPFRz8/nFAXfwpRPv4BhSu
         tkCzKhurOjhy45vJgRE4KEl/6jHEs0xb05BJEFDHU+C2gAZZPSTfob79NduoedkdSFaO
         mDklwKf5OInTvQs7xSDs8lqGoEqEYF+F8TIbyYjRErGHGQVvZJgDpIMMYjxOF62feky/
         5/vvsc+wcSB9jUtkPGou+KQznpH5cpbP3PH/ESKaZLVZwVBrpXwoKauu1k1zFFHgxSq2
         RbdA==
X-Forwarded-Encrypted: i=1; AKwUvBydz3wOHTSg+huTirOgiy5qWVirXCOQ1tP7v7pK93LdhD3hOeX9USuiLoCcpiKjI5zSWodoVSpbmSu88g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ce3aedfvkQ92WeT7kzlVMOpsiC+P2SBYwgfJI0AXsMovtZAB2
	ehsOUlug12jwjh4S8kNaa0Q2X6nPHlymjXiDkeZxnyPAsdPUWKHkF4tGo3Z6Ps5+/NtK8bnnEOA
	Kz3U6f90xnRCQ0XTAtA3T4hmojbcLOmJiHbMNrUAa
X-Gm-Gg: AYBFou1JMa5K7DvfF9M8p/NqgZGttC+1O1g543qAObAmQvJmmKD3ak3bOlUfLTrtE/F
	7QFu9zB4veULA+j1uekVegX7QPWmB45NFE4SULtEG9FlPmywNjoUZldzc9Rgjn67M0S4MRHF3+Y
	2ziTyTU1zAZ+5wio5zE0ks8oZ3J+tPCgRnEDTASi+ELWCxYu3Gf3HtJGdf3yw6403yWeawO8h9n
	nzka64ryMNNJL9T/mrOMJYW6MlPhpVNgj12FBQmXsWi4/1TB06ecQrFQVRBC/twQ/4+09/9O/dI
	eXU4ph+wgPtZflmYmHjsfH2v9SXKAxGb+AQBF9+DVyj7pXbAYUrhMngeizFve1A83srPdv8tuNR
	xH1nzUOWL8BYgpeL8y5TwIXIdnp+vDZ6AgJYhWb5FHsVWfqAd8+1jujyiJg8JcpD2TpAUXRJc2l
	SxKRu7GYAhm+H+14CbaJKAaWU=
X-Received: by 2002:a05:600d:848e:10b0:4a1:eb11:489d with SMTP id
 5b1f17b1804b1-4b2e3792525mr718955e9.16.1793723059760; Tue, 03 Nov 2026
 08:24:19 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155459.534792-1-sashal@kernel.org>
In-Reply-To: <20261103155459.534792-1-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Nov 2026 08:24:06 -0800
X-Gm-Features: AclHuK_dqXVxHCWjDX7Q7eybw3sAcf-f-Ua-B2wyA1INBKZKvcYJncwSGXQwV3g
Message-ID: <CABdmKX10Ykk8qhZt9GjEm_vWz4Fx_WGjpvQLeSbohu4O2_8h9A@mail.gmail.com>
Subject: Re: [PATCH] selftests: dmabuf-heaps: print size_t with %zu
To: Sasha Levin <sashal@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Shuah Khan <shuah@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:55=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> On 32-bit architectures size_t is an unsigned int, and printing it with
> %ld warns:
>
>   dmabuf-heap.c:215:43: warning: format '%ld' expects argument of type 'l=
ong int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=
=3D]
>
> Use %zu.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
