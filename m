Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31F425CD2
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888597; cv=none; b=ly8FK871BOR82BrHrtqUxnbu3/45SKcSFlogLRd6VA+CUQCDf5rcCQPPhTvYvI5thPPxHBSPVtDhlsOv3EiUcd8o9cy4m6iqq2+iE18rVnRV7YhdqEvBZyvO+ymrvO4lIqBCeaJ5O/DN3PQTTJzU9C0Ki1AEd/IbDUkM4opQ0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888597; c=relaxed/simple;
	bh=OU6Gd8gTjMk/k7S2R6E0h+DNBnlITc60NlsRAyf9Zq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=kKFZ7znFcjNzfCoFmE5GwmBFUeI0UlnrZfls1I1k0kyVyMdhmOwFgLDwrnf8K2nxNIYxclyN6hHV3HGpLqS5gDDGm7m9U8hZzWw7YgeO1keUfaoajc4sXyniLkGw8ZmxsXG1MTEz6yUkTUQltaAEbhX3drHoU5UeWbXNUsg06S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IZ4i7/id; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IZ4i7/id"
Date: Fri, 24 Jul 2026 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1784888580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVhVYNeSMyFFMXB09bCc3cSDgOhTTCeaRWg3rWJ0U+M=;
	b=IZ4i7/idp6y3oteFX+MItw3b6Shtpkq2WCfKLx4IRdDGWY4W4O8XWIrEO65Fqbjvy1wCl2
	nW8ifgPytr3eY1Yw1mpmscEoKpe48lUx9IxRJ7JfWFNI53zZdzo55voXZgzmMIYaHczuBC
	A4wA2GSfirwI00CN8+WgWxbdXHGaFWOuFoY9Fx0tz2EaHdwz2drjFZfg0zTT1211IC6TBH
	F6Rmop7WUQK4uN/v+eZ/9c9lhfxbixR1ZgSG0dn7TnGx6ZE99NFY5ODecgf43zcMO5jjbO
	q6a3FnSlzcaamfLV9UreCIniGLrTExAO1gCHkbKx7S4KVKql3k9CvPD9nt5yMw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH v6 2/6] firmware: meson: sm: video firmware loading via secure monitor
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com> <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
Message-ID: <tiocu5.1w1r6qwzlmu6q@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi Zhentao,

On Fri, 24 Jul 2026 07:04, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>From: Zhentao Guo <zhentao.guo@amlogic.com>
>
>Add SM_LOAD_VIDEO_FW to the secure monitor command enum
>to allow decoder drivers to load firmware through the meson_sm
>interface.
>
>Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>---
> include/linux/firmware/meson/meson_sm.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
>index 3ebc2bd9a976..3b90b49d0552 100644
>--- a/include/linux/firmware/meson/meson_sm.h
>+++ b/include/linux/firmware/meson/meson_sm.h
>@@ -15,6 +15,7 @@ enum {
> 	SM_THERMAL_CALIB_READ,
> 	SM_A1_PWRC_SET,
> 	SM_A1_PWRC_GET,
>+	SM_LOAD_VIDEO_FW,
> };
>

I would include this in patch 1/6.

> struct meson_sm_firmware;
>
>-- 
>2.42.0
>
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

Best regards,
Ferass
