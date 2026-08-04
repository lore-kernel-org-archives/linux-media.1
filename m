Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1843CE4D;
	Tue,  4 Aug 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832180; cv=none; b=Igfzm466irbS6BuEyO4UqQFpRo0RJUqg2VW7u3caq8irSgSdMIhSvZkKA1KHvAFTug72n/8LGfczCwmxTt4JUqjOtHcB3joedX1GzeopyVTZImj5jpuhusHk24GC4bSh+F1FaXgh1vFxlcsnaT/aEnj92f+x2OKJYlikGCfSWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832180; c=relaxed/simple;
	bh=u45aOxzysrT8leRCEfHEZ//saarRkjOA4gG1Cwdh6zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSSHCV+/xnFG22s/ty06C+iZOxqu9kkywA89u5tdzPZvf8FUifGG/WX+6KhI3r/069H0GrNW2ScfY4q+FEWv2MaNOQUvErPHNprL7UMYNdeko3gojZanquB06ZC7vOOuD8Ev1HFseoYN4o6tqVAlGKa9UlcW054rp0GoMVFMdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA+B5xhQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA+B5xhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB991F000E9;
	Tue,  4 Aug 2026 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832179;
	bh=u45aOxzysrT8leRCEfHEZ//saarRkjOA4gG1Cwdh6zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dA+B5xhQigUK3M1mXynKOemJigcQdgcbh9OWCOwIc4eTyRFQ0CyQnHMGJNxRBAcCK
	 eZ11mSxbvFnjo9uB82S1Sv/SMehRR0v9kDewCp3xB9Mai/9ZDxc16gO9XRgj2NpdNp
	 WTElaUMdarHKIrshrWZK9aK4ZglNKsGKIU5KsaRrCxcuJYpMTbUEvU6cM+C91oIUWu
	 6dxhFR/LCRUY7vKtm57pjtO9SmORhZlgL2hxQJCJNtytxAFXFypsP4IAowYI5YEsyo
	 JtfMrX8/JfvspO28HZiUrUxu56ZSJo1ECecZAER2R6e8g4PcN7dICmBPnWWsNWuHYM
	 /scmJQh4+PbLw==
Date: Tue, 4 Aug 2026 10:29:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Danila Tikhonov <danila@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Eugene Lepshy <fekz115@gmail.com>, Vasiliy Doylov <neko@altlinux.org>, 
	Achill Gilgenast <achill@achill.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RFT 1/3] dt-bindings: media: i2c: dw9719: Document DW9800W
Message-ID: <20260804-terrestrial-solemn-mustang-bdfe60@quoll>
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-1-38978de67963@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801-dw9800w-clean-v1-1-38978de67963@mainlining.org>

On Sat, Aug 01, 2026 at 09:04:14PM +0300, Danila Tikhonov wrote:
> Document the Dongwoon Anatech DW9800W.

Which is different than dw9800k? How?

I should not have to read your driver code to figure that out.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

