Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478090;
	b=Cg105n0e2irS04T9NHI+CG0NZrMbZtJKxbTFURjl5JAWo4/1iTZxQujkv/gWrTH8i9sG
	 m9vdzeNc5T9p1rTcatkuwJq84ISuehPemhMTgkHQ7xTTVBg1U7K7AHiCQdQFSUso0T6tN
	 ITbHSq7j5JSpViU7ZgkPGIFS+4Rl86Wqq4kgQ8nk9BYlddDTCU7q0cxvXtWKcHYVUMEoU
	 DxHRrEE/O+Ah8tpYbMtOInqQwxw4rv/DUHhC1RsAcf8Yaqxn2nsjYlUPAe2Sf2BcKrVCG
	 Q7Wn5AjeVAvCq7YAcNMy6vHLbDy2L4poWSeXXQroATK7oV1ZGvhV78UKvDy8CvYmOLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
	b=P/NwwH5NtjeGAhLA/pag42PQYfRRHZfYQnDtquBFgJlgLQfCXFQVXd7+yGZb2AdAGwlv
	 kbMxA2V7f7joRT5bY0wNeWKOd23q0Yf8VW1mXdLnPgKDkEGMDQwHuy+Uk0Qh24yXPu10d
	 e7mZStvKv7HC3gqA1zqsaG5xybqXkAWVS8pO7NAAa/LfdJpMm6BFERLwjp5U8jmbtS+nF
	 47XVl7AkcaQPp444dFWOlVEOdOZ1l8h4aCWwp+pO65IjHArkKImV1rtAYL6qDVldwIdx5
	 d794h4wonDGRe8gEWV0VQOmQY/FR+gYyAeeBnPV6ScyEP54LlAD2N/pxtaxwZXB+psw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyrFzfDc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CF606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2CF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyrFzfDc
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso4837645a12.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478088; cv=none;
        d=google.com; s=arc-20260327;
        b=nKm/b/u+vFQH+JlgampNQIrvqi5EtxsrGmA1EGsob95qeRuA6N9ZWfAbekFMCO5/dY
         mXkSqLUWmbK+E2Z50M3YcYwMznBgG0QGnVIRDkTBGBy/ANR1vuwxvs7iF1l5wuAC56m6
         NUwH4z1gy/2k7JhesMPAiaQLtEo93Nb+KEAHfS+D82/ugXSgfDReH93xyWN4OspUFKn2
         Bg0CkVVRsFdyKrvxeTflBZj0r71WIOVLEE6qrWxLPqlfU5yTaXDp0ImVDdL+1vkhdemr
         DGtuB0p1kGRUeeX+3rFXXDQHaM+XXpO8kbWrcRffUx5w4cBkMKDObIz/dYLNNRx06ZJn
         8dCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
        fh=eAeoucIyZPLXRjCtZnIuXmXFOdegVg/uf6No3gXUPgc=;
        b=MVZQ986CeEfl8IkOdSVnYwJDjYTTTpxqLA79FQ3z3VIBWXxU/IFWrDJrbPuqrRHSt/
         Yx2a0f9qextEy9kdR5PQxIF/jP0XnzIkAVKV7jpW1N0hmW851AF0N1FpSSh6dlrIh/Xm
         rbwB4Ae4EM30HM9SPjvWWyvuoUTXlaBnzkGJWEln/lxXVsBAarZ36VhK89U5psrPS1tJ
         BHWNqw/xWJYyZ6ynSQsa4T4pYu52FEBACXvjTH99Y+J7hmt+3b2ri3TXsvfXIdssCUn5
         XD+UQsuGkb7F/vBezgqxipva3whC9gajgGyaFWKZ29kLcnC6rnAMc2Gse8O0qghzaPYB
         dP6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478088; x=1793082888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
        b=TyrFzfDcm//CDOdpT58Hf++OQ7UIqKplmBjhAvdi/767yUNkUIh8lNwsDadn3DEYiq
         AYmms7foplWL4NJJsTIgQMEDkrriffcVyxg/C+Gller3mrNWt1wDjKeejhBX3VN94v8R
         Ht2cp+PU1jQtDbsWG783Hs02ePiUBi8rLcfeKZgwcKp9vL8GpiDNKcs2BMIwstIIlplt
         G3MKSNY6kAlmZSEz6XMGholavTtUTUcpDq0mTjcDdajune0rqHqWC2Sm2bKS9+vDDCKE
         g+4eej3ybfw/Zot0DBcboJFLpWgDFLq18+ZxPxAPgwvnA7BU9vv8rXcB2ug1t4GLSCY9
         sQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478088; x=1793082888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
        b=L4LSyTLGWhzQHIw91E9nQwvserQF85+Bo02LayE4OibwEIkjxgqh0j9SMsWECd/g5j
         DaglK8NwJzOIAwILuWBM8EkuZxwBFgRQKxcs3gYV4xV2evIwFkk4JChCfnMRlstSHsfj
         Bm8E2NsflPxGEYK8LXffUb3jcK3XtJiwgEmbRZRGfznOqlCKN2vW2Te1JGKaCpmevaMp
         lArZZl5F3boya3hlSPRpW7gn4JUfmgC/H23kEGA9ccicoFDPyKVuxWFP4T7MQaW3f8qo
         4ku8ycCTW6LJ3pRNzeV7N2mHdbCIWLnWbu0oUCD7Xjk9xoxTeVN9vQNvRO/Ka/v0AAiI
         cpWg==
X-Forwarded-Encrypted: i=1; AKwUvByP9TY/KD+2dDpf2dQtApKDPuFNtfOqyP+34sMexTwxYdBehzeZtHgFdtnZ2oYQcZ6Rc6H6gbpyahMOBg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJeRTPqQTFmDrrbU+H5Ky0tFY3DJ43BxoeWOJzfrRV3f8B3a3Jv
	FW1ZMWeTtH2ytMxCVrdQBZapvE1M8SR5+sp5uy/ogxA7Qi4QYgIZiv14iijZ+oXeIieuDFtVGFs
	4jJNDNAVSBomgmLwR6KWuFR0ntNYMamM=
X-Gm-Gg: AYBFou1aIgunZtkAsKingxittrQsmJk1Uzc+iG6X4oLJTvi7rcjNeicdhdFywhrHxGf
	2wsYGtWNuhHcopS1pxVw9lDIepnY4FKhzQxiv9liyI9sNp2oPzADIy9OIsewP1AOmdEeFUnZDQA
	nbAcc0wpoPuoBz+22JLdVFKCxSoudLyhUPpmDvxjdu6eVn3SL9thPqr0lEhFnQudrxkAnQ1p8vG
	mn8uB0lPLiKJp+eUB4PrT5tmlWs17tVmVe54+y1pa5ed/+p3KHUrdUnGRoyZQoKYsaIzE39rQv5
	OOiTVynqmNSn26easkDCI4+dISRCFY66NMqUj5P6yku0fsB/2EoVDGKrV5xhgo+1gbeGy7drVpn
	9rJrplGmfgnWjTnXob3gVocgaq4VWRzHpLy0jxYRxB+3hi7nGg2T6GSAN7BUaa7bY7s+99h8k4B
	QdLI6dNWxiFfTtE8D4lXjOD/Sm06wNcHR5dA6Xmk2u
X-Received: by 2002:a17:907:e109:b0:c43:6d40:4f84 with SMTP id
 a640c23a62f3a-c436d405421mr304474466b.4.1792478087855; Mon, 19 Oct 2026
 23:34:47 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-2-patrakov@gmail.com>
In-Reply-To: <20261020015001.15672-2-patrakov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Oct 2026 09:34:09 +0300
X-Gm-Features: AclHuK-0DWmL4ciHRdqJ13K1229Nrgrf0eszph6lmY66CYqR_mlykGne-GAUrRQ
Message-ID: <CAHp75Vc_yxWNeuSi8jwTtT=0CvrBW1nQkHvzEYkhqkGhRhTrrw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ov5675: Defer the probe until the
 endpoint exists
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmail.=
com> wrote:
>
> On ACPI systems the sensor's endpoint is a software node which ipu-bridge
> creates when the IPU probes. Nothing orders that before the probe of the
> sensor. If the sensor is first, there is no endpoint yet, parsing it
> fails, and the probe fails for good: the camera is missing until the
> next boot.
>
> Return -EPROBE_DEFER when there is no endpoint, as ov2740, ov13b10 and,
> since commit 437e1f6a9600 ("media: mt9m114: Return -EPROBE_DEFER if no
> endpoint is found"), mt9m114 do.

It is also possible (I think) to call reprobe in the ipu-bridge
driver, but I dunno which approach is less hackish.

--=20
With Best Regards,
Andy Shevchenko
