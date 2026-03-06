Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345F351C3B
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 02:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772764747; cv=pass; b=uNkeg3ISR7zYAL/YQ2BncCKxf/xPaY+I2NasKKG8A3ooExrom1AO3qRwLsO2mLqx0ztlKSzEpeXBZtfKcCzbc644mbIs0BVwTsA5Z2mr6hV+LAhN/SyW9bZpi6jrdUqFZIDAZ9A7vK7LLoL1wKIOi2Ip+g4zFwZkILdP2dNctf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772764747; c=relaxed/simple;
	bh=ntNhpeJKHj9Gcz76mVeBjjXdVPDLd/l3flMVyUPRa+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJSBfDVAdzgA4lmePnHJuWEQEnX3taWjvzd6SM+UmtkzYU2gLLJBJp0LK5UofMrpbLhMLatcwoN5HpswnKRz3132ounP6H18QPqvj+9/WUlF4EOUH3K3hRvIG3WOTsUBKulSyagqjJhs8CfmP4v7W3TaRtKsjz8zQtDpDjJixU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0WnyHUM; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0WnyHUM"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a2cc31e20so33892971fa.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 18:39:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772764744; cv=none;
        d=google.com; s=arc-20240605;
        b=BAorrmb/M3BlPTq1oYFDCDpqPYHttoUaDOweyGeIc7q1bSNpfTlNUuS5HMNABRw/DZ
         Kn4vsBv6+wjahZA1O9WgMMHWwRnCfA58/gP2gSZruLDLbFznXvF3HpPNTJ2BrR/VVaDD
         EV+ZkJsQ5teAKzeKtNvI5NfI7yILNLw1XoALEwAQUFwQTSV+Jz0k4/8rji41nUbQ3Id2
         ACBtkc2Fr2vp/D2/5KGex9d5ce0fa2BVRJi+Pp0kUpbHOQvGxYhzZLSlmifHD6EkUw9c
         5XCZiebYY1DJrba2P6AH1Lk89jmXjOqijcPSTXrEePJJceZVCXlh19A3Tov+8TQ298Uh
         8KEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        fh=h4fXn49cNG40BerNIMml+38Z2n63yGeg+D4NGBhcK0g=;
        b=iu2N9hjJ16JlNInuiZjTXWgMfmATJDQ7bPggRwi88+gSqU7ewE0RrwVP1A/01xNFzV
         55DRHIPlpYkyRoHJsX70INJeXozxr+7gqawf72cgYMD14y2TapEjBMAi0HFc5N0BDVVP
         FGbfFNec6DMybheOWGcVsaHqGtgaaSvyEuT2ywdV4uLGEKmMyXadyZhTYTbHi0v0fBo+
         pFyAXaC9KABPW3aWv7GwtQ+KQ/v7uh5h+i9XpAFhIwS7jimsvKbE70B65z8dzvyeBnAt
         HSqaHZhsFaW/65UsUCZqmnAsNlPlf5nnCeyy/7pe6qFmc2TOROW+3rsDO4STUZD69upU
         G/tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772764744; x=1773369544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        b=M0WnyHUMMaDt5lsk38jX6ASC8QdBxr/eDAckBJjn2P62s1fnWfTS2AeVTgjQT8Hxnu
         9u5riaPHF5Co2ynsFsF7kP9l9G+P8pOjvkqtvNjbz6FjZs/bY6FNgqwVi6kvdS3UQJ1y
         opgA1JQaW3qG1xRnDzHVy4vCb05jjg69HrNgkmdYVVf25XVhK7hQ63bO7kwwrecR9qMx
         nMq1qY1gWxR/M0YciIRSwO2+DD47BO1i5cEwc9pumvFX0Gl0oSVwCb3G2VoqgNuDx1uo
         8I8XWoWlOu7i2veweuZoustWDxQtdmzorBGc/TomL/fH1pONAWxNgLqra+qvfoSwbKHW
         Vsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772764744; x=1773369544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        b=aXcGFzAcsh6G4i6Qx+xgIaPHaqrG5k24CA2VXXJkhzzdE+hlb1SYcU0YQ0RCcXwAMA
         TPXS00dMm0M//WSk1NIkCKDBy3vETo9K/c1ovkKKV41xw9eZZbnxsit2Ng42q3OTTqsr
         B8eKHUrlxd+euHN3j7NA4LPTqtNUcU6f19hMPXNp1RS5VGEV/MU/Un2uS39pIWW+6u2l
         y2AwX6PmNRiPVryZ7PT1xaQH22tj+rpIx8oPP+euWbN1OmCdFnMePPBRQoSU95xRFma9
         5c7gVOCk9BOW+0M0ahLPdJ61jV3cLV/XzAepTBOORa0w72FZH0c40hIT1GpOlYa5A3Lv
         61Ig==
X-Gm-Message-State: AOJu0YwV6OrDgpRc1e6BEWMW8MGO4FEmXABLF0qwGD/NJIwYy2K8CAl9
	2+FbhHdE0mt8h+b5cZlAfhyXAeKlA6YePKgSzA2WvNtDulG6mlCDA0vv1H8x2fBseFhaHYHeEjc
	SbX/3vUXOIfoFZwuiDlNZ9AJ77g4CtjVGfQ==
X-Gm-Gg: ATEYQzwyXBakBXSa4oQG1wtrMX1J+iXUNEZK+XGdS6jly/PQWLUnN6PoF00Hag/Se1p
	32Qob+qEjunDS2XC3/nGMaQ1EI0rvJ1F+vtQxPROlqzOCj0RRSCJ9UdaTWHUVZ6Y+Nxuqe23Mbl
	g6llWXYhR2GGUhm2X1jGcgGZQenOLj3HTBgudFL1YXeLPmCj8nahZFSUskLQcE6hEGJMari5emk
	6nvxwrsIPIPuvEQ6afcNG+RUzF+M6IF7JYKxeeuVGbUSWm5CiEoMNpimBC1Juic4bcdDBQx++UR
	09hrnJ6SkNfQU1ZIoeH+agy83W0cVJw1q+dCGtY99kFIjuPVmS7erDozp1QKDIWwUbMfvtiI
X-Received: by 2002:a2e:be23:0:b0:385:c13b:5584 with SMTP id
 38308e7fff4ca-38a40d6e2a7mr1475161fa.36.1772764743976; Thu, 05 Mar 2026
 18:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306022406.760-1-ming.qian@oss.nxp.com>
In-Reply-To: <20260306022406.760-1-ming.qian@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Mar 2026 23:38:52 -0300
X-Gm-Features: AaiRm52GfF-aVTbn8TmD62YiOKnhcu-hzGhY6Qwg2C8seTj5WNPRzZ_mAb4wZdE
Message-ID: <CAOMZO5BP2aLD+a1r7hVd3F4Qvfovxb8PgQfzcVRKknBHWYBmtg@mail.gmail.com>
Subject: Re: [PATCH v3] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:26=E2=80=AFPM <ming.qian@oss.nxp.com> wrote:

> -       { /* sentinel */ }
> +       { /* sentinel */ },

Drop this change. It is unrelated.
