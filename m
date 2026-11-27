Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795819517;
	b=vKOGIYQeiQb0WYgkgTPq4Kr8b9/7C+vonjm849uefZhH9fpy1PMcy9bmPGLgjXeaefrX
	 8GzicLMnjJWaL5XLBabLbA2bJP1PVNQwmGT81ZpsnqNiWWfLc2IbsHjz/We2kR/VPYyoe
	 va43mpP1TnB+1icZEA8T5U6v87AZPJ/ViTMpq29YpnE0ERjcue+0cK8+eTS9MPDeStHZQ
	 dm27aLUsQKZK6yiz1npzFLC789UjlztFPFaTqHbXrYwhxFZ1jBE9ruSrIh5hUJL4oJrdx
	 IlBzIIKw4VsRQeG1WYeUvdTtAyrf2FqzR07/ATBUcwV93y4INex7/HRVbop7kcvAFTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qF+VgAOV6t6D/gtyLmFatVBNJK0mwOBBZcdi4fFbBG8=;
	b=E0ESEh0nBkcA4m1hGZvREnyOyU7QcSKscGrFXz6HfKBFIqJKmJpnSCwxZjaXFzi8ALjy
	 mDy4y4De7epCWCeVt+Lzmqdivftc8okpitmzZbq0orPUOinCJQWDAgOpGwsBZRb0fWMyQ
	 FbY0mClrBPp7ASAPZ8pxjFENzP2q+N64z3co1lfrzOLH40roMhG6RKUDCXS5VbSjW9Kjo
	 Ggym5D5fkLV8dzQYUKI1fOsJEgfQIfdl44UaJBFydulj7aUzRWdzRwLV9uwvJWg62H2cX
	 8V3eem6Faoqn8D1Mlyu/7gv7cWEt2Z/30UWSUjtakMWHP/Gr78oryJeF+wNETXQpOMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epmedjQ9;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B25606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 22:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B25606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epmedjQ9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38622e0dae0so959997eec.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795819516; x=1796424316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF+VgAOV6t6D/gtyLmFatVBNJK0mwOBBZcdi4fFbBG8=;
        b=epmedjQ9K3r2EmYEVvAa0wcz2MnAHPzd7HLUeyGUzBmWtzThinJ0BKA8pg1G9yf1Mb
         mJ7/dNcrncx365Pz5C1tsqLTyMvuSnyzCKPS0frzwk3UxMUT0Wix88P6wwBTvr+jCwJo
         IkVTnStf/ohwBIWI25zFumZt0Brf/VXEZ802Dyq0eJUgd6vOgTSe9IX+BBcRZGaUiJSt
         o7vnG3crc3wl3j7tvKn70jsXdOHYeQoijDKhHCuLhIMLr6hCQjgZwzdyAvFwOqh9fFPc
         eV00Rxwnjm1yqxOCM5EbWoDA82deu+7AlWGNi+11vBDMQ2bU59ZYWaexbmlGO90ZagCi
         8Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819516; x=1796424316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qF+VgAOV6t6D/gtyLmFatVBNJK0mwOBBZcdi4fFbBG8=;
        b=SpY8NR/nsn316nardrbK7mSFkJqPf8U5S1o2pSPO435SeFFvjAnXwj519ESHToh0l7
         mPjDplTNMomHWe6GK7boIIv0d0Oi/ouvT3CW8wTkkjjIbk/QuMhNodvUruE5aB1mUHwu
         d6X2yMuMF83mo6WvooFsLys+E/srIMhiBhKRfDz2lKXEXkIDvgBj6urXVCjUZrOF8FY/
         21toAMf1dDXYOdJSMtjswQ0r48OIgVYGcGgl7MiVz3XHiCBi85VfEjJbVGlU+2Jwbzml
         x1fMZUhIbwyE5kLfk9GmjOnQJxKgwh3Mou5Mik9hzUmMbCcHnFNBmLO9soLUVooEx1y1
         Qu8w==
X-Forwarded-Encrypted: i=1; AL+hErGrDeZCXUiLZzG6H650FcVtHck/wOUWyT99WCCXJgOOa6yiUTtBBFRkvVm7eTEadcEcsdkz4oPwCK5EtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MOYdVEHP2GmQkx1ywxPlcZWH4l2u+cXrVlbrm0oTYwlC3wC7z
	s99hnXN3Lz472VhjO/W+kk5/DOWZMQMlLE0tn5IK1es72CdJApQPReZV
X-Gm-Gg: AZFdTZcO3E4dy/BqB9/URsy2kOesI/aaDf8ma1DS6L0kzQrYDphUejMrkbllHGdDTsA
	Ps/M7kSTjh4syDcBrhmhOjQuNses2BqixIqgFDGqgb6D9dEBdl+TgbI03tMZg9kd4tSS00YgVHD
	VPUxfiJ6QdbZt7l+51LZaVHP//I9IHy0qKPr44E8DIFjh9gdmuc4IigUF3qpb28DlAvACiL7CYp
	PkCA+rDbBMB4r1XRhLesmj+QmqxHsb0XYO8Gc0tSZ6lwRr2H38agv9Vx5i3tr6rmnqkTdWXijlJ
	4wqpxkeQYxxp7VK+YZSnCqSzie3s0qAaKr4MIkaic2ICaLVu+Io4baAHRZ2uir8dByUC9c0onuN
	7Hr6ILnpVEJoKLe+IqxTxeYJpVmO9wbO20PoHgu3duzwMwWrHJ4X+k3y12whiYVmpNDufGg6Q11
	v/PQyV1Ea10yI6LVO73aGrr6ta1hiDRSyFE8m4QgQssRZ+Pds3G0cC6MJxsmeCLMvVCQB0cAj7I
	G8MEGmkUFciAZfiN0Zw0QAbc7soNsJ8ds6IPSyUL09Egb9t/lxnm4Ffpnv9PDdavl1SaBwdSD/Z
	T9goz1qBWsskIIo4B9BI4JN9Thi0RIXssIPBNZk9gpqme75Vt5JWgfZSnMcshbagT+OWT1Q0Mce
	AFCtacO/ePEIGegEvsAhm4LcyFE2j00CVbJJeEEr2CZt8qyDTyfCEzw9Ln8k9sR6FJbRHuhgSbT
	TracbX38g0rQM=
X-Received: by 2002:a05:7300:16a3:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3856ef457b6mr36896026eec.2.1795819516056;
        Fri, 27 Nov 2026 14:45:16 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm85785158eec.26.2026.11.27.14.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:45:15 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Robert Ijtsma <robertijtsma@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Todor Tomov <todor.too@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI clock, and strobe OE
Date: Sat, 28 Nov 2026 07:45:12 +0900
Message-ID: <20261127224512.1813336-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAPcTEm9kJwZw2_i06e_vp+hH_KMNO0nP4x57ZEuhebDJ84aC3g@mail.gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com> <20261127211653.1675314-1-antoine.pichot@gmail.com> <CAPcTEm9kJwZw2_i06e_vp+hH_KMNO0nP4x57ZEuhebDJ84aC3g@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robert,

On Fri, Nov 27, 2026 at 04:55:02PM -0500, Robert IJtsma wrote:
> Feel free to add for patches 1-8:
>
> Tested-by: Robert Ijtsma <robertijtsma@gmail.com> # Surface Pro X SQ2 (SC8180X)

Thank you for testing on the Surface Pro X, and for dropping your strobe
patch. I will add your Tested-by to patches 1 to 8 if a v4 of my series
turns out to be needed.

> 2. Use pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend() in
>    ov7251_s_ctrl() and ov7251_s_stream() so the 1000 ms autosuspend
>    window is actually honored across stream restarts (which also lets
>    your patch 7 keep the common registers alive in software standby
>    between streams).

Two small points on this one:

- pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy() itself
  since commit b3db492e8335 ("PM: runtime: Mark last busy stamp in
  pm_runtime_put_autosuspend()"), so calling both is redundant.
- The Fixes tag's d30bb512da3d predates runtime PM in this driver, which
  came with commit 207f4162f1c9 ("media: i2c: Add pm_runtime support to
  ov7251").

Kind regards,
Antoine
