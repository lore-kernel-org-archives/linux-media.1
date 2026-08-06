Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53E421238
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009508; cv=none; b=tPOYvcxYSxNFk+yLzGiXCRcgyG2H13I69DPP5yyFeEUCSHGdrVbZXVqeu3zqmErDYfi6jsEiifYE8A/nkAI99PtSDaqy2fWSbIJOfZxVE6plupTnMweUS1DeAZB7qWpXKRr0cc3YqkByFu6hrIOnQhdLCBCidpBlKKkNKsNltB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009508; c=relaxed/simple;
	bh=LG9qQaCKhF0079OaY8ZKwiYgi3jpJGA437LX8i/NVg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBN+wYxZejNTjnviAfBnbdLxdI7IcLKBlTDfIuVIXWWbPBOCrgRfemQ2+S4f5viGB2C1yYkjcuScHdQUj2XtZK1aaCx0gI35D+CVSafFPrBEX7j7afxg+63v4VtXkDDY7QZrw/kLyc72vhF/3y9/cxMerQX4wdkyMqHaKiHbsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1VtakQJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1VtakQJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2466884b3a.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 02:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009507; x=1786614307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LG9qQaCKhF0079OaY8ZKwiYgi3jpJGA437LX8i/NVg0=;
        b=T1VtakQJVSEFFhyJEh9sIIhxsMoYqlwE4cxJplnbv1jrFow7lgImoxirvr8+8dCFiS
         O2L0svLjjHevxrk0MnksluCsnUIcgQAc2fqGIspjKXL2uPhdVi6ZVlznNatwVkeMKpLS
         pDydFFWQrtT1RGVpBAkOV1zVF17bbNary4cteItZIi6gQ+lywnR4pR2L4qkXSp6xymkj
         IeKdJwFt5NtcU3H3jr6FBJnIwzm6MY7TdhCOn8yhAixDuHSqDHeo/P7swrzZvThESoPb
         KRPJ+/KE2lbjJpp6jAKxdNahSen0s6kx48MXWA1LWkb7Pri37OMl2k5gzzJhoDkaLVEK
         77Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009507; x=1786614307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LG9qQaCKhF0079OaY8ZKwiYgi3jpJGA437LX8i/NVg0=;
        b=PDOTK9j3pEw16JWTe5lbVwBWi5UAfQGh+rbdKBiW0koFzq4vIGxg1GZ+Hpe3TLQGzP
         ddBaBhm5hO2b39d/vTL0ujf1KmlDvOYUthLZPy7nBi23C/HEh87nrcVgZDZhEZMP+IHF
         v750Br5IjHEX7mNvEr8RFLwd9DhY9a6OwxEVxMGXkHEndPBPFzP2q7OKqbnCilQgVaxN
         aFsAZG7bQK1udlfx6GvBUymOubU+DAa51Ij52CXnTWBN0mTzYkWmqoPiNmjAu/FWGi3+
         aOw20s9jKMJk78t5EzveQBCKiJ1Jh4u2iF1LVNEBzfYxkFh8Q2SN6tyg0BBqRAGn8Otj
         6Iww==
X-Forwarded-Encrypted: i=1; AHgh+RqDdzck6XKSAJlSUJMZsuth2/fUkJF9W1fLTfmiA4rMCW+bg6xLRjiTXeXIoxr9VPHRkzO1/+VPu00QSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5317cClChwBII10Vn5i46q4dvNw9jfpGqWgiqq7oqGP61FvWJ
	Qr756gPQsREm4XvefCu85F4N6R3OdgiavczIJjyuENO9/Hj35iBY7f9o
X-Gm-Gg: AR+sD112Z3wfYLJwVyV+A+vx37hZCpig7dyht3uQmABGcQec8TTMKXVvBKv1NPDjDef
	Dnv9ZBb4gvvudrSI85rbnKTpqpO88y4bsOt2RpFlQZJBcKnTcgkQgV2UCo9SCQmmTv6sjtL4VJr
	RjZBpb3O9oQk9zZcC3GV7MDI3/HGICYslkoDDr9ZGaaV5LBxWAVCMR0CyfelGKQNUJl/p9AKXSo
	6qinbPZYQJ8/7o4kyAC8nuwEXbHBIpHeQJRt0WwVwtjDerjO0rPgt3uEUSU09cIePZQL9fnR5eM
	o04xYAD8mc2bIA23JB2JWtq+u7wwPV568hVeSpx/LmcZYELnv+Bexx495UzYwiLHE1naqniMPQ3
	s1CKb7kFvZD6QGrZIh85EF3G/AUXSZ3Wtb56msFtpzNBJ/FMKaFMyWrFqJWe0mwwHGHV1B1jc1y
	5qxI3MeYl61yBTzdk0PyXaj9172iZoR+aaVNnGhJv2OgfHvWX2L4u8uzeFrDbIUxRk1D6v
X-Received: by 2002:a05:6a00:4143:b0:848:6720:6fec with SMTP id d2e1a72fcca58-84f2e05e73emr15363801b3a.28.1786009506446;
        Thu, 06 Aug 2026 02:45:06 -0700 (PDT)
Received: from eos ([43.245.121.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc5696sm1025470b3a.53.2026.08.06.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:05 -0700 (PDT)
From: =?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
To: ribalda@chromium.org
Cc: hansg@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	reza1234khan1234@gmail.com
Subject: Re: [PATCH] media: uvcvideo: Make uvc_event_control attribute name array const
Date: Thu,  6 Aug 2026 15:45:00 +0600
Message-ID: <20260806094500.4729-1-reza1234khan1234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANiDSCvhLt7kWn1bfz_h2Tw+SMs7AsLM-pFyhADZh2-Aor=gxA@mail.gmail.com>
References: <CANiDSCvhLt7kWn1bfz_h2Tw+SMs7AsLM-pFyhADZh2-Aor=gxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ricardo,

Thanks for the review.

I went through the whole uvc driver looking for other variables that
could be constified the same way. The attrs array in uvc_status.c is
the only one of this kind (an array of string pointers). The other
data tables in the driver (exposure_auto_mapping, cros_colorfx_mapping
in uvc_ctrl.c) are already declared const, so there is no remaining
group of changes to batch together.

Thanks,
イムティヤズ
