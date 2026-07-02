Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599726B2AD;
	Thu,  2 Jul 2026 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976561; cv=none; b=LDSQOnjXJ4UWULV3SecCfcraUHzG2T/XIhKeMjc0tv4zadBoagCEZnd5eSKdB49j0i6yUfHPEhpGkxN6bmQ9hnE8dYDDFdufPaDR0LDnLzqmqSzdLadcJKVWvGP8N5uOMLMa1djy8NKVY2oLOM2zDFrocifyZw8Ufo61YcnWLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976561; c=relaxed/simple;
	bh=uK+tGcHuxumpn0r/HhEEvO6qoUSxEA+hXCbeP4IU0Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxM3rtcwiRtRhVbyL/vyg+QtQefgG5BGENDki9/WYorD9L0F5W2WIqlZrOHobARvYjP3egO44sYciQ1keNacFr9bYNnchK5ev4nDWlhJwYvYM97hjbrQvW0ZTEeVc70q5guufTrz5tH0esYxPI2hPASqnmYtXtHk9Xf/2xWdmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeSWiXWa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeSWiXWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363341F000E9;
	Thu,  2 Jul 2026 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976559;
	bh=xZuexnlIldizIVI1ciEFra7BMFjhF1yUKSWEY9COTh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeSWiXWaQQIWTt4l9QAaCxpHwXHTI+Lty6LIowreHGecvLHHGRLw5wo5bWzvMYxNU
	 aMzZQb2gpbZt6HTNqDKHm+zFCMDiZEkswMpvPFCRSerbHyHb5BIX2OrZNXCmqYXman
	 lCYYw1KyxxSKeAexFq5tRgq2LyZGSSd/401+jBSGlZaBHKflHuy/lMlDD0t7Ae/3ZE
	 KygDCQCPzUn+T6Y+piOolYNHwFBlm5rcCWaIwx5d7kQDO+H/8w6NqJfJhrA91M4Exy
	 MwE0U1dHUmoPSr2nXSHWq0swbDzdBTo6IRd7kf3PTNM7npqG+c1wMQ386d/IgRXgFm
	 WYeALd8Xt6QCA==
Date: Thu, 2 Jul 2026 09:15:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Message-ID: <20260702-generous-beaver-of-perception-f2a9bd@quoll>
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
 <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com>

On Thu, Jul 02, 2026 at 07:02:37AM +0530, Ramshouriesh R wrote:
> Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
> near-infrared CMOS image sensor used as the face-authentication IR
> camera on laptops. The sensor streams 10-bit RAW over a single MIPI
> CSI-2 data lane.
> 
> Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
> ---
>  .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

