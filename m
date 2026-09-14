Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDC340B11A
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371737; cv=none; b=ssA4E4euHeB9U1pjOyOBsq996or2MM2QdDWheS8F/sKeinlX+5kEV5UCeDzF0wtnSKAjLwHCioe4yYzp1ZHLNxAMXWJntcBUlDTAUO4/RGKXPffMbIeTXGdmzhtdnlBuHQJznyS3hcXUy7u8D4vm+gSq/cGxUT4DAYlvx4ajluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371737; c=relaxed/simple;
	bh=qxBJayCiOyPWE45U4ceMb0h0ZJ/ZOSdmY6fawgMyIYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha/2twjjq7JWWZaoDg912mnydcATAfEx2o9BY5SF1/1W3D4Ub4haBYa9UFBmk6LK/EUvwcHuxYwMmL1p95ahWDg3xr+gbLQnysYIAQMswTBsDLEtoTV54mhRHckpjmneNJasMHLLxW4Ke33tJ+v90EDcZh/3ADqPG5TCCeZJc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=MOC5iYGm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MOC5iYGm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-486e70f2457so1464536f8f.2
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 00:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789371734; x=1789976534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2KUt/qsAR7zk4GN2xUX9NNamEm5HOmsqxp3glS5MHw=;
        b=MOC5iYGm/rSEmR/nm51sFYbef1V3sDnXftXsc9nDvFcAcbEPNTI7sQlW+4SXdWCVUp
         bIG/Inb4UsGldyx3pmjnMLVsSqkf3VCPE8HlAn9Z2inwH7RjnCY6A1Bz2W+tpF41PFel
         +OA4Dx+e1oyqBa9T9QrRTWYIC1cFKSB0f2DYQeVx2QzZCZki3NWJrgph6v9Bi/lGY742
         eiNtsexuv1dPSlBumHWyunvEiLgdtBasKqbcmizTfgmXQhNZdpJiOnJjBZvci9ovMN0W
         avdAF/F8Nm7xco4Ez9gsdzFxTtYXr+maIcr5+RTOWsHMRYPxYTID+Xm2UL01mw9KeJxh
         ek7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371734; x=1789976534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2KUt/qsAR7zk4GN2xUX9NNamEm5HOmsqxp3glS5MHw=;
        b=bAAimf6L0RuuaWl6c0EIb+d5R/xFHl0HbK4Jus5kwMtKM+6qKD6CstaHKoJ8AdXHi5
         zU779JW/8HN3ZChFXFVHW25nncCyfl025MFcgq5+DZtjwKNIXZE//MNy2tAhf56MDDhD
         OHn2GxvTE8y3za2f4vYOY2/0q2UxHvUBQEFrlPCvNvg5GTi5rSko5HisE3SCGwpeytLo
         m8Z2Rq/PA5aCv28UXKyqniv+jMqKA+K6V1aWcjuBV59aqmScHVaviAzGlFC8TjWdgb4z
         o/Mve5fK17aewDcaAOBwFOSvroru9mE6i24O1iLVpwSl+0viKjFGyV/f6ppbu9vzKKJr
         UE3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOkLfDgBBEY2Phi/Ew7+RMwJLQux4UI3ypBQ1hd5iZ8ZTDAE86n3A1NH+qaVG9ksyP98qBNBpG68uZyg==@vger.kernel.org
X-Gm-Message-State: AFuF++nkcNlghhxWFxmbd5EztW0J2gUntS8UXytX/ruNYn71zYbKaE3d
	ckQjT7lk2N5t/aqozRm03hW/fjXRiYOP3VkUSdMwo3afLZtedKlMYObS
X-Gm-Gg: AYBFou3+E3JmMAnH5tvJ+NEGEa6EVwi/90HK2cgWKvPH8Z/3pGbkdEq1Op4KCIPxppq
	l3EaJoUWkBO92jzArDqgL+DDJQOTJDiguglD15g8BGOHiswJjEOIAYlMW5FESyNtgdpGEsx8fdu
	T+Xrd26A4co9Y7krN0HP41Eo3Y3rMOOFI+5CBJhTYcj6hm108cBukiA1WySknp0avS9oBC9us5g
	lRfYrFl8Et9duTRdyp4DoW4X1DRkJ45dUIoODvONQaepCY4vb1Hp/knQQgumz0jKByq9kYELgoN
	0By1m1PXq5VNH2NLL2eu6gWpiGn8MH0t+RTOccoarsLHXFfw5pmOY6lrJEHp5uzk6RLwiDeGbIY
	lKc80nwDrm9qt4zcGuRQt+LjXxehnqdO3HTwXhHnX37qIgFdjenVR9UhMjhzqDkhz+EsbGCsR52
	L0/DhZymsdb2P1RwfylGZ8TqK8QV3dIPq2ndEvZwTAc2uA6TMGhmYs9SAu34bdmtkZE0NZok3BC
	1FWATGRDknEGQnVMxk2ycG6psLTz90c/cUjKBR7RR7s1NJKH5m3e1ZQK2OpIOFege18Z5nibw==
X-Received: by 2002:a05:6000:1787:b0:486:e5f7:89d4 with SMTP id ffacd0b85a97d-48702b3942dmr1406068f8f.54.1789371733954;
        Mon, 14 Sep 2026 00:42:13 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm24183216f8f.6.2026.09.14.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:13 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: gvozdoder@gmail.com
Cc: sakari.ailus@linux.intel.com,
	miguel.vadillo@intel.com,
	linux-media@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH v3] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Mon, 14 Sep 2026 09:41:16 +0200
Message-ID: <20260914074130.24756-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912185836.309071-1-manuel.knitza@googlemail.com>
References: <20260912185836.309071-1-manuel.knitza@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correcting myself: I wrote that there is no in-tree CVS driver to
terminate the path. That is wrong. 7.2 added drivers/media/i2c/cvs
(CONFIG_VIDEO_INTEL_CVS), which provides exactly the V4L2 sub-device the
bridge expects, in the same series as c6b1b34b5090.

It never ran on my machine for two reasons, neither of them the bridge:

  - Arch-derived configs hide the option behind
    MEDIA_HIDE_ANCILLARY_SUBDRV, so olddefconfig drops it.
  - Intel's out-of-tree intel_cvs (vision-drivers) has the same module
    name and displaces it via DKMS.

With the in-tree driver actually loaded, the 7.2 graph is exactly as
intended: an "Intel CVS" entity between ov08x40 and Intel IPU7 CSI2 0,
sensor enumerated, frames flowing. So the CVS half of that commit is not
buggy, and my legacy_cvs workaround was treating a symptom - withdrawn.
Credit to Spencer Bull, who found this while packaging the fix.

None of this touches your patch; the IVSC case you describe stands.

One thing may be worth a look though: that Kconfig placement is what
made a whole class of distro users hit this. The driver is a hard
dependency of the 7.2 CVS path, not an ancillary sub-driver, so hiding
it behind MEDIA_HIDE_ANCILLARY_SUBDRV means distros silently ship a
kernel whose bridge routes to a driver they cannot build.

Assisted-by: Claude Code:claude-opus-5
