Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78135DA41
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642792; cv=none; b=QuVIGUURTr169/i8Rmc+Ooy3EM2hYr3dPnV40m8hMx1sClKE465vRJlSvb8dBZt9ELONBVNOncNXZ4Bg+HIY+PsBIkuHo2LPpKEKT9t63EVa/BrO5bhezK8kDZSQIrYAkf2npCj+DE11CxQnCDVJeUiUXOTgYGFRmNWt6eC3pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642792; c=relaxed/simple;
	bh=P/ajryO77wM1dIuq7a0NCYHewcOhnIj0+irNPwlH8nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNcT8/xk31NnP46qdBh4xX8WJvy3SY8dQuSgcEpUWNckNN7u63aBkatOLq8yAzRtR34EU3Sisg6SNsUXjkndBZLgwjaFDO/w0skZKWcW2Xt8DMZUH/eu7Q364vJ1HDhvX27WJQ1vwDQnI0lvyu8S2OdOsBHFLkIxp0ZdBNpaMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF4UTfjU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF4UTfjU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482ea739de2so1443974f8f.0
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 14:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788642789; x=1789247589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEJb+ortCeV38BBeo/xkf5nvIxpIMZYEirOIZ9ybnX0=;
        b=WF4UTfjUbY3vuOt1txZ9ZWR5ntjSxaY/wIp8rYjp2RHrA/8OY0opHKZ3HYOh6h6hwk
         qRe3idULDy8P8ObuvjMPpC5nfaj/YqbvpSckdSmiUtcSOd0RJx8v4fZoXuNtG6K1tQ0A
         fb7BGdEJLg6WzcZ8mont8+u2NkB2Z6VbaqKPavtYNcTHHf/UJlQVPHSqRyaZFpwuX258
         Ntrx4+JrYc5qHjpXQX4agur4uZJmOt/Tb81RJ+mr6plXXc+B8UV8CHuSt+jGjMSBo90l
         JOT+LdXU8YihdcXhlqJNfR4dPqk0sPum2PArIIV+hraJHy7bcA02CDplqQxummgnuV2z
         ZHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642789; x=1789247589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEJb+ortCeV38BBeo/xkf5nvIxpIMZYEirOIZ9ybnX0=;
        b=g/BgFmg+Mw01qmk6I+ryz4I44ZV650ZZ+UWqxirSzf0vXcKY94bIpMEFJ+LV/UFRp3
         NQWHvGC0H8N7etUVB/DG6SyIMIdCaCt9LiyTfCE6f883fXc/3zHBW2T8sIS+Yj/NyI/V
         jlfhl6MByv++RTyR+7gg5gqzjnI9xIMVtB09JbXlxJKJYAsV69pyc8j67wM6R9yoWmhJ
         AVZPhx8+tCAYCvyTbqWKBIbTO/eufq7EkmAVyegO/tR6vVfJVL1o/3N2TRx9LSJf8Sts
         v5sJiEmu3OsHH8tfLHaAGri85lhX521qrVdcivJRU3spJjoNtx+1jHiH9S1OVmzqGvRF
         Av1w==
X-Forwarded-Encrypted: i=1; AKwUvByIk1Mmrq/zvUJnx2EA52GuLMV721ccr82gqgftpihi49ja52EAGYyns0+kFojFqEQ+8f8gopyp75Uyeg==@vger.kernel.org
X-Gm-Message-State: AFuF++l+02ZVNb11sVIdzLcmliAnwm9ikiuNow1ccam6MSIwC5s1+dFi
	/GVET9goO5jErF6bH1j/717fKMf0we/2cCGNBg/fZXYmzKc+YGkoA0I=
X-Gm-Gg: AYBFou3lEIjlcz8fuF+F70gUBc9jLIsLdL/HUKMiGPgPGyAVn9tFPTTcyQXf/fRdbIL
	H24P80uEIYv4703LEsWLw9SodrowTuBTBT+fI3meWxL+JuBllSGNut6kY0165LFMwdhGtXIYYUX
	vNy11dezv9s5OL2102xUwZL0s6aJxy2TPZN+MIRsnPfjiKDlSgOZLawFZ6A50vTn1sixTlstpAo
	Ha2MSzS5J2hYra3iCgbT52ArH6gtBrYLPPEtDPDRTCcaPonyHYidIRrWGUB+MZbZWUDEO9jNZ9I
	RS+M7daZ9Tr+sOL/6u4BkGY/2QzZaZGfanet4Vp4XKXoylNQj9QwxfBMPn847BO6CRQCeAK6yDk
	0Bo+5ktgbUxiDfie06J270oYMkadPjSWO8ShpB/rYtfb4dprw8rHipRFTvzm0PW9i0jhNZfh5X1
	FAJlaUo4q/9+b7Yia8YB/ZMAfAbiBWXqFHTNKz19qtxcXXJmdoTHdtzAG8yKn1cujRytoD2m5KK
	b66lM/OacJr5e6xw/2CelwVVX66VcticP5yYfLg/zUv
X-Received: by 2002:a05:600c:1d0d:b0:49d:99c:3bd9 with SMTP id 5b1f17b1804b1-49d099c3fc9mr14536785e9.33.1788642789066;
        Sat, 05 Sep 2026 14:13:09 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17218558f8f.34.2026.09.05.14.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:13:08 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v5 7/7] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Sat,  5 Sep 2026 23:13:07 +0200
Message-ID: <20260905211307.542810-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-8-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260902142322.73523-1-fernandorimoli11@gmail.com> <20260902142322.73523-8-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Fernando,

On Wed, 2 Sep 2026, Fernando Rimoli wrote:
> +	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
> +		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, IPU_BRIDGE_EP_CLOCK_NONCONTINUOUS)] =
> +			PROPERTY_ENTRY_BOOL("clock-noncontinuous");

One small thing, coming from the ipu-bridge series I have under review in
parallel ("media: ipu-bridge: survive module unload and reuse the software
nodes on rebind", <20260831140304.45940-1-dmanresa@gmail.com>): the software
nodes ipu-bridge registers are deliberately never unregistered and must
survive the module being unloaded, so every string a registered property
points at has to live in the bridge's own allocation, not in the module
image. That is why the other endpoint property names all go through the
char[] members of struct ipu_property_names, copied into sensor->prop_names.

"clock-noncontinuous" above is a string literal in ipu-bridge's rodata, so
after an unload the surviving node carries a dangling property name - the
same class of problem my 1/2 fixes for the "lens-focus" literal. The fix is
one line in your design: add a `char clock_noncontinuous[sizeof("clock-
noncontinuous")]` to struct ipu_property_names, initialise it in
prop_names, and use `sensor->prop_names.clock_noncontinuous` here. I have
that variant applied locally on top of your v5 and it is what I am testing.

Two related notes:

- Your 5/7 and my 1/2 touch the same link-frequencies block in
  ipu_bridge_create_fwnode_properties(); the merge is trivial (your
  IPU_BRIDGE_NEXT_PROPERTY() indexing, my copy of cfg->link_freqs into the
  bridge allocation). Your series is further along, so I will rebase mine
  on top of yours once it is applied - no action needed on your side.

- The MIPI_CTRL00 gate supersedes the unconditional 0x4800 = 0x2d write the
  Surface Pro 7+ downstream drivers carry (mine included); Fil's Pro 8
  sweep showing bit 5 is the only one that matters agrees with everything
  I have measured here. What nobody has covered yet is bit 5 alone in the
  sensor's 2x2 binned 1296x972 readout and through the IPU6 hardware ISP
  (PSYS) path, which is how the Pro 7+ front camera is used in practice; I
  am running exactly that on this machine with your v5 (backported to a
  6.19 tree, with the downstream 0x2d write removed) and will follow up with
  a Tested-by for 4-7 covering it if it holds.

Thanks for the series - it turns a hack several of us were carrying into the
right thing.

D. Manresa <dmanresa@gmail.com>
