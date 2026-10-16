Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90764B0E20
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162534; cv=none; b=FjFJj99szqP1phm4C7y7b43d1LX7FbuXqXiQUdxgajuf8oIXidRHsPjEj4pkDw+d3rQGwwzBLKPFtgSkDxSF3RV64vBqaG8sXzZJovk/xIXE4HDhCOslovaWfDQ47pFxymC6pIVXJ7SCHMghzv34jMHnmAYscGTSiRSpKEq2Hxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162534; c=relaxed/simple;
	bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYpeHMeYP5+VUK0EZscJGajmaIonGtHoQU7BFoVemPnNoi96jnhzj/3ZwvS1s8ccWWatAUqUus1SF0T9BHCJJXvS2iCCAh7y3y9yKcVvc/zoDysypVd0jei6BN6738xfdIH5p2z1ilAg/OSifCUsLrSAsM256zmzCVBhAL6Vtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azeUESbq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azeUESbq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so345205e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162531; x=1792767331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=azeUESbqOBkDCpB8Ky0uytp01D9QkVAe6Ab4e/Ah1T+BBUuzuQ8UQkJFiztpQcR6b2
         U4UQ8giy2ElHxqgO5vQ9/GUyQY34xHj/TgsIzPMMGnH5yoZi9zCqLYqHQFdFgGRQhhUn
         bKurq1chu3Bo9AwGSxRGgmalbZT47XBG1k5LkfVPuK+mtv2vAcyamAb/kaYDY3pzkdZ7
         en+w6JNs9SL1T4f7cgoKprq23cyP9Tfn+AqOp9ShkeVWaJuxQaxmBf1yO8uO7yZTpvGZ
         Rd+7bvdiWdK/iURLnTYkhm9mrzYWp/DwutewQK6ldVGpif/5IhSgYDliFekEcm0knlVa
         356g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162531; x=1792767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=L9JBidl3s4qhT/35MkjeM9flo5oWK10yRmevAknMmE16ijasVg50KNMsDYXxjOw4bt
         e7d0KyVkOTOC879UKWQbR6ow8JuQ6PjPJtVxMyw8PWajdn/CkQ39VuHXFJz/cI8eExMa
         awx+kHlhDIeUfFvvzOIdt4Fg97LqrbyGDQzjkXl/w8aMpumicSPKqgdhtGd+SC1EhluE
         LnjEfwNAeZtL1jHEeJqUX9spvoJolQYeZvWx3NvO+5AS/m91n5I5xLF3+odtCnJ+Pfmy
         YOHcSlQPwtP5e9o7zsIKio4NJ7b2oFGYuUMJa4ozl8jzdIXpcjtPEvkgJhzkI3GluzJv
         qlnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHoYN6sguKha1pYFEbKoaLmHvGis3ybyPU2QKAldSuMVUmI2vwzefXQv8U2qienMQsca8E46HNjiY7Rw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKYa96CBN8wrkx7EBlA/PoS1UQUi0JBo3gImR2me0vnFX/8pcRe
	9z+0yIR+U9sHIqtjovJM9Bb2J6LEfaxYi1KX6zlBEgCNJck9JBc4HkO3
X-Gm-Gg: AYBFou13P8ZIU/SVL0kbZE4gRy4uVaEzAst2SONM3eVc5YDUNlnWh0Rk6Hvw9CApLUr
	OwQCv/zXIgcMJqybvchZFswirW4jfs27HgeMGXnt3yRrPzRvNqeF/GGk6QsJpFcj+zw0dfidawT
	ZjoFWlRh8BPyJ4gB+YCB2WjLxEPY1ym/O0gEt/XECKtIdZMXs5M80D+lZG5oBNouNI3DTudHMM/
	F9SCqSiRk3hiQWoFvkz2tNoLW8Ge7I4LwzIljpwVNf31ku9MfEDSF3B1FjGwPz0HIjNzuMpvT2k
	0byXOZdT/QrqtcD8P6KYjAmc5bFILAa7eBhGOdTo4MsVrL7Fp0FjDy6tMjDtxjTBdANZKETlN5A
	RAdf18LasUlll1CgdZcQPCly+jvHkF6PdZDVFKaWX+M4xKsGR4a0QoxhXPvS+ATROy7NKYNHair
	aMR9y6PlpqyqU7lTFK4ebxMR0wbW4XMp/2iOlIMHSsWn4SNFEG7u8go1/UK9KDBIVAqcoqZw4ij
	keUcQ6P+h+esLnOQn/sQj8Ezy/p/eXK/8v/1Kh3SSvnTnR/yB4w17o0NenVVQNz0/PO5/InHNMy
	kU5YJ6k=
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr1162945e9.23.1792162530858;
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm6324206f8f.5.2026.10.16.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Fri, 16 Oct 2026 15:55:29 +0100
Message-ID: <20261016145529.36811-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016070018.11932-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261016070018.11932-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 08:01, Sergey Lebedev wrote:
> Through the media device
> one test fails, Active VIDIOC_SUBDEV_S_FMT, because
> ov13858_update_pad_format() never sets the colorspace. That is in media
> next's driver already, not in these patches.

Thank you for testing. That failure is fixed by "media: i2c: ov13858:
Set the colorspace in the pad format", which you have since tested
separately.

Thanks,
George
