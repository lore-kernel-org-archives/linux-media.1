Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA53A6EE6
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200290; cv=none; b=QdTS8ALFRM7fQ642maOI9aK83T6w/LSRJVwgxy1RloKPtgTxiQg//RU/7SnTU+YAYY9kI/9Kw/jNktnSETbPBX5bbpSBDGM1wC9tEPW9yib4TpEgmDyJ5iXL6ObgDL3efvl/VDQELR7JztABUKY0PWE9D8JG7WlKc7n85VRvGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200290; c=relaxed/simple;
	bh=59NyyHL41/fxCKnVpkaZ9/UftIltcgBlLurz9X8b9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxN3R3cl3qK6iIr5Zs/9xizJu1pMXl9zfpsSzjlASPy4CYmtPE8IFfe/EHEIaoG9jpl3eF/ltxK9J5eHD/H0Melw5syrpNoDGkb1tXQwSYSadnQ/5t4Enacj3cHUwDm/R358G23KiRqNLAOusxRTg/5Z4fkqHxB6u4/iesfLerY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmFpDPKe; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmFpDPKe"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482fc3327fdso20457f8f.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200287; x=1788805087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtkK6MeXx36zYOmLk563en61hTj5SYJiMnh1Sx9Z2s8=;
        b=AmFpDPKe+Yzzuh4X9MjlgpxQeqRNOMJ5mQretUU40ad/SSpzb6zNLYGbu8DGBOnCGn
         MCYuU3M8E4MeKn/SOfrkqEkHFcQX20fWM8fHdyQHjZLHc3qGLZ+HktO8iWz6WQHteX8C
         CZ1noK6yf17ALCD4nqBEpVex8ZNsKL1vp6EPQ6Dd6ryG+SPth9SiuzWzSativ3RoM29d
         VTWjsXuLaHpM6nLHAtBPLehicVV75ECMv0orEXDiqEZX0hWawjZleaUGf/euIdoFpqPX
         7QUb6+WLSk/C+yXi7QvEFh2mCKwYgs5bmOjAcjU9pxrOAvFwxSuYBj/XGRA0i/risgWM
         7ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200287; x=1788805087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtkK6MeXx36zYOmLk563en61hTj5SYJiMnh1Sx9Z2s8=;
        b=ZPo7QAJsMz7MA3d50A4+wUYSOMUbTVZAhFFU0LZOdFokhENyjXxz2wGmV7+/l3W3ED
         S34VLqtLbp3hqnUy+ewwZbMF8+3BpCA9Qer4xOJki25faqyGsX9KQFmnnpJWz4srFPHG
         cbHEjQjdL0DuF0Zr7IGRPYXUYVe24+4IqAeEeP7ihCbZfB3Dvw9MHys/OAsNgQqGNo4p
         48Go2Vp54qk0t34Ir+ZvEHEdPacwjwxbIYEpZoD2xrvn2l9/lm79/fnhXdcFhkeGd8nO
         rz9GT+BzNCYAhlwQ0O2BWXY5+hrE7QQv6B/2rrzjFFBXvgA09BWsBimo0ecKGN1firnE
         USvg==
X-Forwarded-Encrypted: i=1; AKwUvBxUAy+XlZf6hdvuf2P9mxjGUDE8S2TlvL7gWcHY17Kl27N75KcJagkOQh9RnyjrMjdpbEB2nSHWHcEAjg==@vger.kernel.org
X-Gm-Message-State: AFuF++kgzWKKmXJFQwcy3Xbdb+ihFmd2BPAdTKbj2dRLWLCwqT1b0qGA
	jO07NeroxCC47Hm+iHYjZcRkWTFp80ne/lnWJltdaZ8w9wk55gZUdAh0
X-Gm-Gg: AYBFou25MK4Kn5XGEd/gtD0mAL1Pns5aEc8qyOqEAWtXVv+wnNnfP3ry5FHiexbIDMT
	g55gyhIdwCE5eSCLxCP7myN7ioFa7xERJNKGU9y2Be3YeRG/1rVa5G12EP/MKyGrOsmsRJrkyu5
	3OPPVbPsniu20PaTliMdkmjcq9wTjTC81vOojn5aN4pYNqY+z2sQ/j4JLGC5dLcdFr3WlFM9jlB
	GNQch9JYGmlYoI8S1R/aYIoYpirJ6otOhx3dhoLDmNlaYYuz5t17vpymkqTFMw0ABUzgHFknmC3
	CgFRhiKzuwojBp4mPnQCVfLi37uoR3KoiGzIAGAKt1iY6X+pFOxIs2NL9MrkAEi4Rgxlzjicl9x
	jek5KyA2Hna2I0eHj3JlOvTaiMxk9Ygmjx+lvu0P8UIeUDDbMRFs8K9u3DrjfWl2idqis53reWd
	j9euMJmIIaKlo10YF/TFJo1ZGUftW3ZClgapqNEbH2+A13ww7CYt0GqvJTyODxClWxdVTZut+4t
	fyct1clKNj1
X-Received: by 2002:a05:6000:4692:b0:482:d7db:ec06 with SMTP id ffacd0b85a97d-482f79cfc09mr35102693f8f.22.1788200287133;
        Mon, 31 Aug 2026 11:18:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48440e08b43sm2656289f8f.22.2026.08.31.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:18:06 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Mon, 31 Aug 2026 20:18:00 +0200
Message-ID: <20260831181800.322529-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com> <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260720163819.104130-5-fernandorimoli11@gmail.com> <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for the reviews on v3, and sorry for the slow follow-up.

> Hm, I think this is functionally fine, but matching on PCI ID and sensor
> does seem a bit quirky...do you know if the IPU3 case is fine with the
> clock-noncontinuous flag too? If not I can test it tomorrow.

You and Sakari landed on the same objection, and v4 drops that helper
entirely. Instead struct ipu_sensor_config gains an optional IPU PCI
product ID and a flags field (Sakari's suggestion), so the ov5693 on IPU6
becomes table entries rather than a special case in code:

    IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
    IPU_SENSOR_CONFIG_MATCH_FL("INT33BE", PCI_DEVICE_ID_INTEL_IPU6,
                               CSI2_CLK_NONCONTINUOUS, 1, 419200000),
    IPU_SENSOR_CONFIG_MATCH_FL("INT33BE", PCI_DEVICE_ID_INTEL_IPU6EP_ADLP,
                               CSI2_CLK_NONCONTINUOUS, 1, 419200000),

That also answers your IPU3 question without needing the test: IPU3 has
no matching entry, so it keeps using the generic one and never sees the
flag, by construction rather than by a PCI check. So please don't spend
hardware time on it on my account. If you are curious anyway I would
still be interested in the result, since knowing IPU3 tolerates the flag
would let a later patch collapse those three entries back into one, but
it is not blocking anything now.

Since a PCI ID in the table is new, one semantic came with it that I would
value your view on as the bridge's author: a sensor with both a specific
and a generic entry for the same HID matches twice on the specific IPU, and
ipu_bridge_connect_sensor() would then enumerate the same ACPI device twice
and consume two of the four IPU ports. v4 therefore skips the generic entry
when a specific one matches, as an order-independent filter in
ipu_bridge_connect_sensors() rather than a rule about table ordering.

Two other things you should know about v4:

- Patch 3 now writes only bit 5 (clock-lane gate), not bit 5 + bit 2.
  Sakari asked whether IPU6 needed bit 2; it does not, and my sweep data
  agreed, so it is gone. It is also now set with cci_update_bits() rather
  than a full-register cci_write(): the ov5693 does not otherwise program
  MIPI_CTRL00, and since this driver serves IPU3/CIO2 and Rockchip too,
  touching the one bit leaves anything the platform left there intact.
  Because that changes behaviour I dropped your Reviewed-by from that
  patch rather than carry it. Happy to add it back if you are still
  content with the narrower write.

  Since v3 a linux-surface user also reproduced the value question
  independently on a Surface Pro 8 (Tiger Lake IPU6, INT33BE rather than
  OVTI5693) and got the one result I was missing: the vendor value with
  only bit 5 cleared does not stream, so bit 5 is necessary and not just
  sufficient. Details and the caveats in the cover letter.

- Your Reviewed-by on v3 2/4 is carried forward unchanged onto v4 2/6, as
  that patch is untouched. Thank you for it.

There is also a new no-op refactor as patch 4/6 (endpoint property indices
assigned dynamically, per NEXT_PROPERTY() in mipi-disco-img.c). It turned
out to fix a latent issue in my v3: because the property array is
NULL-terminated, a conditional property at a fixed index would have been
silently dropped for any sensor with nr_link_freqs == 0, INTC10C5 being
the in-tree example.

Thanks,
Fernando
