Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74F477984
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394447; cv=none; b=AyUZ3gUEou0MlC6q7d2CRrmNAB6D6ZG9QRYqVH/KNxNOaVQkGc37aBEELEXtU4HmPedXOwU40yzE6VI5dgStlVyY/KYBGUUC3BFc2ZSSDy2aGTeQPCWdd4RWemXJCu6lzhxFGW/HICAt2m4Czr9PyloJQMmY9/CaimjrzgPSwkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394447; c=relaxed/simple;
	bh=FaUj94y57MqF0xGZwbDMThspB5OgCX1jKLOlxWFPJv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAS7OIsmmyIA1MpaWiM9yBLa/gt8OrVQ9mRYjmOisnyK+fLdQNMobr1V/1TsQ+5AXK7iyKNWgcLxRdqNKed5ulqnrtpt/N2lzUjZ0NMtj136V0zRTxjLm3UOEb3lZkPFymNlSZRuzG+/Xs8q6HOnIwJCcLM5vmPuHg6YF07hT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxldTTjT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxldTTjT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482ea739de2so2277950f8f.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394438; x=1789999238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ3aa4kXmKrH0pgjyTlrtAOwvYzjPD8Dyimbg+nXXfk=;
        b=fxldTTjTc4ZU0Y7QeW/HsAIs6f3ptHWA0LBKWMUTr2u+5ui5ZkJIkcbG/torV+7PsI
         Q9yRRYegixSHoMa9cSAF19GGvMvdFcmi5jdpHh0ldEtf6ryb7ixuGRGwuAbzJNWKRbgE
         tBH/Z0x+QRSQ8ogChmlkwlJ/1JKtPqIIxVi0zfICZ7rPCsCDQRY6cd9KngyScbeNqd2n
         gFV5tNRAUKxhv5vj4VeqgfmiPyVVYqxJYgrnmv6ZHcN924YogHQ4Y9+/qkF+nWSpEk/G
         7LFSsmZ6BidkGzXM4CFb+fy37iDLKw/pk3JizLaq/y4czqb/6Qdf/0DARIH0yVroFKDJ
         7jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394438; x=1789999238;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ3aa4kXmKrH0pgjyTlrtAOwvYzjPD8Dyimbg+nXXfk=;
        b=Pn5LU2GyBwhECIIYFC2M9aAWHtGR1fvP2bUzUtm+DCIJgG938HmI1Jcle16CnJS+hf
         GB+sb8U3v2tPdg2Sb3S4fkpmH9+2mp7/VLxlHKqASFPjJAh2FvRWnU3WzWhIRee5upXv
         vDSfjJrA6zK+mdDx8FNfp8Z9vdXElqBGvXRwNydEngNhVX8jNdQVhY1EVjGZm1Zge6ba
         6/LHxTnQufb1CzJX2UL/VFNwJDqbVnn+1UH1BBN/rSQILCEODP9klmeSfaFzZnnT2E9W
         sbzjRCN9rw+cnI2V64wcwjjtL+2zTPlWR9xKYaIwHSsTfm3H3nO7LD19BfQJ5TzpzosJ
         f+/w==
X-Forwarded-Encrypted: i=1; AKwUvBxEBjSLHCniI4SmbohDEcSOkctlF6kqbuux9lUBMhVoelosCxv0vvQJPh/lxUAe/foDKd25QL8YOafA8g==@vger.kernel.org
X-Gm-Message-State: AFuF++npL+y0CIrwBSVyMt/IS0cgWfgBrJNGOpgkFBA1sjjqo5/hihBa
	GH/8iDC0ijQH3g8Bgs5wMTQgqehdSzA52RL+KuF+RIgq2qo0VN67YB09
X-Gm-Gg: AYBFou3Ueuj6j0Qscf2MkqZVfoGEIc7GH8P9hNPROb91A8jvcZ2JxmvcC9Qg8RMcwXO
	1iNCLIn+23xV7GFoGd9i+5sFPfHJHQAN9XZsSVPFryfTulIgw9bSVSLlw3ImOIdmiPZ32uO5TKW
	P2giOgpzOMIPlfut6MKx50/2bOSqqL4QAt9/zXYTetcM9Lz7X9eRlObvcYsLZ1gs7plOZ1EQ7D7
	nybZe+LX1y/6XVVtKGA98OwgGjXzcHpjnVwR1k5QMcwtHsh6WO0azJ64vum2ZmKe1hCYNqTC4z8
	TzpJ9Tw+Coa2jnzICduDXyOv/vsjt5eTbyAHYhGouiv0Be/kX3wmzSGXHClgQ+4rRDjqaY/HXXO
	SrBIsYcpc4uugWPtBUPX9W5hWEH8RFk1mCIoVRe9DgLvrQB0xY+XWvTNzUJ21fgFEKY4fIAOkti
	0BWudSAJ52fT7cn3NJIQVHaYCmXzEFRD2A85CvZXdGfBv234fKFmTvhTUBd0i8AK6vxzldERiw4
	/p+ra/imiTqldRKxA==
X-Received: by 2002:a05:600c:4746:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e7a63a654mr33329975e9.2.1789394437734;
        Mon, 14 Sep 2026 07:00:37 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm676620395e9.6.2026.09.14.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:00:36 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov08x40: Implement the selection API
Date: Mon, 14 Sep 2026 16:00:27 +0200
Message-ID: <178939442771.2622.14821982022354625878@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904134524.595598-1-pierre@pinon1.fr>
References: <20260904134524.595598-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pierre,

On Fri, Sep 04, 2026 at 03:45:23PM +0200, Pierre Pinon wrote:
> The mode register lists program only the low bytes of the vertical
> window (0x3803, 0x3807) and the output size (0x3808-0x380b). The
> horizontal window (0x3800/0x3801, 0x3804/0x3805) and the high bytes of
> the vertical window (0x3802, 0x3806) are never written and keep their
> power-on values, so they cannot be derived from the driver source.

They are written, just not per mode: ov08x40_global_regs has

	{0x3800, 0x00},
	{0x3801, 0x00},
	{0x3802, 0x00},
	{0x3804, 0x0f},
	{0x3805, 0x1f},
	{0x3806, 0x09},

which is exactly what you read back, so the first caveat in the message
can go. The same five rectangles and the 3872x2432 array also match
what I see on a Lenovo Yoga Slim 7x Gen 11 (Qualcomm CAMSS, 2 lanes)
with libcamera.

One small thing you may want to consider: V4L2_SEL_TGT_CROP for
V4L2_SUBDEV_FORMAT_TRY returns the active mode's crop here. Looking up
the mode that matches the TRY format in the subdev state, the way
ov08x40_get_pad_format() does, would keep a TRY set_fmt and a TRY
get_selection consistent.

Thanks,
Oleg
