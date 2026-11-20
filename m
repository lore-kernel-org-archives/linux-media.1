Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214849;
	b=VbfRXaduvof6vCzBA6G23fXMEfaSnD7C3BvWtqe+9Icb391VJXdhLF/vAGANOqnxdZ/A
	 xATFu0XaHqGt13MxD4vnBMsOVMDEBxysNf158kIaoGtprmITzvCor/HECy1INcgbN1154
	 RtTVWNoV1Z729rLvAVVhw51EoZIsoB3Lguc2s1CYlCi72Ib1VYDC5jPucFdbQvyyWqqv5
	 0wwFMf2qDNOyd1PhVV95MWcH6rr1xyv/UKhfFqTfy0ZLlO+Q2vovqnMnB1Fz9GaaGTSlX
	 Z+7j1IQWQrlA2erS8EPAtIWcHQKrWTuFVZmAjMyNLLL9Zd62OSD/JNwkdV8xfyCwrmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=hDktAyyJAPG9jc8GPRxfEzIEA8i6qmjQXTURV29xE6Y=;
	b=vZsunOJ5xnT5JGEYwOj9Yj5kB5WtLCBDwnfp3eRCXwoPiOwOjhhgGLfO1ILN/AwT/ES9
	 8RL4DUbKTjdFmKZyi7XsYG0a4+0qywy/vokc+WDx9T30mG22piTUiPQl8yTL9RuTs7NG3
	 noNa3FTtXyWCBlgQy1S6oehZ6QiziTSqaDXYOH+RE0/X7tGzrhqdwXOPnwiFz79xXaOtr
	 U0u1weZcByY/9/VIG5ygp3QXk0UTorSiUL6SmmPSKu7bB7uXjc93XFuDOiv2KRfpVJa/n
	 TRuJ8HtLIqXJCVxR3ozSv7kXHmkOLBaNas7R5kB7ijqMVQk6dtHI0KEM6BHbDMfK7KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqI6DP+3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4C606A68E
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 22:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC4C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqI6DP+3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so836535f8f.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 14:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795214847; x=1795819647; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hDktAyyJAPG9jc8GPRxfEzIEA8i6qmjQXTURV29xE6Y=;
        b=YqI6DP+3PWKjWwhrVSanSRfoeCtUGdxyLFN0q3WF6JcLPvi/aGITEW1BCBWNIWYDe6
         Hn+L+vBVQ4WjLXv2V4SsPm0qUF1cmmGYAyMip3yyHdLdRPVpTI4m3DcZpfEn+JsTCBTp
         +u7nZpbaKaSU/FkE3IvPShMxjhhBKeDiBhminR/33hzO0JsMRF9Rk3ajRpvRrH+vq6y5
         t/C/0WPgnuT9Rj7IYbKwNughO9V31PjasVWfo2npVPrnCTaOHO7C8QQj1KQYKZyFAOEl
         BqN4IWnY1uYgltPdSKMfzbab+vJZca6gVuoaVApUxSxIP79izKHooXtSL2bRMMI5jrWE
         f7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214847; x=1795819647;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDktAyyJAPG9jc8GPRxfEzIEA8i6qmjQXTURV29xE6Y=;
        b=C+yNYPzx55vOOU8ICr34sSMCjcFpUvLKCE2MVjSvv+CC3QLgXoEWtuRS0ziWKEokYU
         /gc5fwrXIoiz4jIL9SPdUcStPYTFwXpTgMOdHRsUpKOI/UaJqj43Xxoxivb6CdHEr88Z
         FFS2tldSXW7JdVhVxJNWcNgI3tEjXDtlRzdHm9dX1ApbLQODIT/d3SC3D2dlz/vOYc/z
         KemL8axu7UnR0EQ/YAOMWgAMdvgRfqCUyWS+vbHkygdHtuJ0FEjYRQ8/hDF8LpLis9YF
         yo6Rh2yKt/CHICtfEcUlJ1R7ATRdFVuM/Q+qnM9nj4SzItRmi4ImPWSOG87u/dZy072z
         5Y4A==
X-Forwarded-Encrypted: i=1; AL+hErGEn96Pm06Oa4ueBeWHfNNHhTdTEEzw5bjKMLuHrCNDZCDEVYPs193NdZO3CB1Y0zzRGhIu+WgeMYdsDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZVG5c18C4vByJGUNSqZdEh9sxlRNuLnDAjMhGgEpKQowT0cNM
	NEUZM+buKGzX79NIjrGkO+3w0snUkLn9HyubdRKLxB/6VafRsm9OMEE=
X-Gm-Gg: AZFdTZfu6dLPytp6Sx4UE6ACA8vBf1dHFTRE86ZkewBiVR9RWsUvfI4IiUlggAXMhB7
	koTComm3uUeqyGqozILC+S2SIVBDCktMRQne2+qFAsRlrudZ+Kv4X+lZxQVx0MA5ZFDcyMPZgKr
	w70Bp59yR85iRqB8DMA/5i+yvOJeeyNkLLojBbgu/CSczRKGjvBsU631c+xwP/I91XNxhHbJaKl
	csottG5qosjh6AM10SqofDR3Q3wjVEo84RB2KO4TsXSpdeWJ5CC2l/QA7xvEEmBrdhwUze0Rwvk
	yd++VwUl+aYLX6Cs8wiGdZsNTzElaVqcyn9gYyzrCfxITiAE8bNfgiozWnYGADGc8IMvwUD8v6J
	4vkGtQmmcS9S/q3m1MdmyLKOSrbG6hCXiYqIbHsrA4Psho9ldifr1TlqZv8Drzes0EktxDJQoW7
	VCshCHH39ON7IgOLxeHrDYZWZbuS8efvpLqRnQPG2LhAplgBADPZdZh4iMC+EnjeHvJ4co+Ro8O
	jzj+2V0Y9nvxeFEtBKbfPjdvIleWHHDVrmOcjcGZtLf37QSGnVKsDXizZM0oChgeDYYXIwygtt2
	pD/vGtGJ
X-Received: by 2002:a05:6000:4a0b:b0:4a7:4efc:11d0 with SMTP id ffacd0b85a97d-4abaf740155mr9169550f8f.12.1795214846879;
        Fri, 20 Nov 2026 14:47:26 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm8148705f8f.49.2026.11.20.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:47:26 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 media] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Fri, 20 Nov 2026 22:47:25 -0000
Message-ID: <179521484597.972404.10406015135695575425@talencesecurity.com>
In-Reply-To: <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
References: <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Hans,

tristan@talencesecurity.com is my correct address -- it is in From and
Signed-off-by.  tristmd@gmail.com is just the SMTP relay that
git-send-email routes through; it leaks into the envelope sender but is
not my identity.

Thanks,
Tristan
