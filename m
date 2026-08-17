Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A53ACA6A
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003508; cv=none; b=WGNA2Ae21rORHLeSH/Z4y3gVSTD4GS+uuLxzUKgRduoFI4ou7MwTJQeCtaz8odlrtsYH5j0TsJZU+Iut+sArsqgVzPItXqqfZq6HcrwGfG5dvfMCgkJj6c8T1pJ0dVsDd82fTZhGY6prJ7COa/rr3XRPkLbyiBZSiKttWz+4Wes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003508; c=relaxed/simple;
	bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=upPRP5d4/D4XqLdnJ98B23A+Q5HFkYYGGXgKBOAoQTTc4AKN+DTGlGhctRwfgBA6BvId6bkL94Kfhk/hbkCH3X+sopYnp3HvP/MgcV9xuDTSp4j+7oIyN0x1OZ+dxbI+bobb3asQWGSd34nRzqEA7iIGVHm+Lo0gmlGGgy7i3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwPb9UW1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwPb9UW1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4815bce4652so2437511f8f.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003505; x=1787608305; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=jwPb9UW1SX52Fv1b9fs63kDA8krQUwh3qpouH7m8doSy/473WwSy7BJNXDBj0DL1SM
         9WBypivTcJoZeWWAJx0d0/CyFRiAmqgWuPf2i5KqQsnjoDvDALp3TBiQFHtlMPmh2gUN
         /yZ+hTIvbZUP1+PBu1Y6Ag+PcN5AZgajdI9hwIT6TTugdvH8V46JTqQhklsIfMTwYdwR
         HHwscat7OX6KsfaMWb0Y1hf3i3rWEc89JbJ50if6xaRUrVGMBXxz2LNO80T2g1+mWgxa
         izvwW5U9hz47WNLCX7IyI9PlrQjqdjcxNqO7krs84/UiGx/z2WYlqQj7hN6ItvCdF2m0
         oGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003505; x=1787608305;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=WECTu6kGWgeq6/uh6Gw8ndgQmZmlz3vYinX9iL3IDoUWJTBL5Vmz0JAJLgFxup9AK3
         qnywew1RJ8k0M6V7nIDYBAHqDPsyX2xmE2eJgfqc27s/x5JFu0dyXqOB2y7k3t2r0Y16
         /l4P98REw4drWYb+X3s+EQtx6WAR8D0yq34bqjmUBpTCwynCG29vNPCRpxFUZKkPkJ+y
         55E7JshCIrTyRV4fntKhLlt92Bv20IIE8GfXNW/udFyQu488aEIy/onTT6avC8T87vxn
         Bd3hr2ptvonDIaVS9Dkmx9XFWaitxAId36fNEUNL2QZAV5TACc9D3JfuNHOJjewyZfE1
         ouHQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1sYbwOlv3uf350ax3qA1u/RsTHGBuwuCNjsOew1T8/XPWl/Iw9pcjFhyEi1gEozBX02p/OuLPFUpy7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTsvOO/GPLdMmqFHJ9QfQPc1fPmqIfanJIZhQ5AkROqArDNbK2
	DERwcQkyg1uMr8xbVZFZZempg3Hwk448EqFw2u+T6sQ01ARAtYOYF9Om
X-Gm-Gg: AR+sD11BqCKsvw4nPZ3PMRQ2XxQ2zCrA6frLs/u66Ymblw3fhaqII7oNcKz5keIRb7J
	Cylx28kOWbn9ZSwL0JEBSwi75opbAgc5m8W7geXKS0yHTsExABNyzuwyw1wvLBRhg9i5Jdziy9L
	G8+tDDga5GVQdygR5ajED+5DzK3oDtfV7I0E/sLZNItjqrFDdY7aZI2aXin9wN8HxCmXScWEHnP
	4UlxzpJTAjpcLo+FVvFXeMKxKAVALPB6YRqxMLhjW2Aw2bxAxQ7cNVFc9vgBPhfjY+Uc7RZepIt
	mI0V5Ld4WOl+bGBIuybEmg4w13Gu0L4Y4V3dLv7JH3K5MvnI2Akgf2ELRkvM/MySJW4OAMHhp0+
	IbKXMyUqxzvDfbxKp71YgW67oVWzZY5F7fcaOd6XnYbcsnOHMXezVSxRaiQdJA8XQWjvO2qQuH5
	4KNvlaMfPVqPQuZo1L56gWZ2FTiLPsSXD3VWu6tzZDYXR3wn6JsNt3N4ESffMjaAATo2nX5i3tN
	BI0jYYmLtd66ytvr2z4cASqXTJn3tU5IMT1mmairRhi1gcnIs3QU0s=
X-Received: by 2002:a5d:51d0:0:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-48160723e00mr37583370f8f.1.1787003505347;
        Mon, 17 Aug 2026 14:51:45 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm7267823f8f.31.2026.08.17.14.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:37:34 +0200
Message-Id: <DKRJKMECRUTC.125CT60ZV5WKN@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
Subject: Re: [PATCH v15 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Inside the err_revert_mode path of max_ser_update_pipe(),
max_ser_set_pipe_mode(priv, pipe, &pipe->mode) is called with pipe->mode
itself, meaning that the equality check at the top of
max_ser_set_pipe_mode() makes the revert a no-op, yet the hardware keeps
the new mode. Am I reading that right?

Kind Regards,
Artur Andrzejczak
