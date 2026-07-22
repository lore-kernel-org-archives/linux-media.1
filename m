Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05C3380FF1;
	Wed, 22 Jul 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704252; cv=none; b=WebAUqxaxbWd8fcT5bPVtWwOA4V6pxgOjD9cCxU7ZTKmltOOY5h32rz6DS85+vUOtHYuNU+i6xsnElongJQLZ2jIJmHHZF8OOsvaA3wrSCtLAD/xscNfF/sGU/mog2HFFAEOP68v9EYGOzlx2yAKBoqpjxJTnVU8AZNM6DISTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704252; c=relaxed/simple;
	bh=hGF/4W1Jicr1QkMn+Cm/pC6hnAR5jcnGTZe4PpzEwgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeAgMWIpqEr4FQM65mVh+Qp/kuppaYWlAVf2Akqqjhzlo5U/KuZmf3fgvWGGDHUjPiAilRi8xsba+hsxTXAK1Ka0gJHqtt7Yg6KXHaxLWkKOpbMQ8dLL1bs2ql5gzZKa74UAdYCcdi+jXEKKE7YOl9xS6icD7yHgkn3hzAyx+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpBaUoOJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpBaUoOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15371F000E9;
	Wed, 22 Jul 2026 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784704251;
	bh=pUBOybuaQ4oLhv5gpLAxGaNiHUDAVsgBLzkdhW8dxfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KpBaUoOJSGKMnsiMgykFnlLyGr0UYTSYsafvK5qGTdkU37nmDEYxE+aytF+Q3r7mw
	 DlpaIYcllglU8Et2PTZ24NNkhmQDxHrizvXN4pKAaccQIPo9BBZRt/p3q7Y3KDgWVC
	 wQFLmdiKPFmhYvU/onvqomIE1e9VdSSPQtIvgFqhLgtLrVaHUfq1QeIrnyhkS1GA6y
	 +SXvguG/AXyp9VnBSv0pemkG0gVkwevBxFGrQCcIgt/uZigUZv8F8i4dVJrd1of1ma
	 /R4/qXbiJRlnj3F6vHIGn6CUYKMVkskalfeL6hTqK23goD67ZpGPEv34kFXTWHz7Mb
	 Bwd8Lr3hZhegQ==
Date: Wed, 22 Jul 2026 09:10:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <20260722-gabby-active-seagull-5aaea6@quoll>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-2-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721064115.64809-2-royalnet026@gmail.com>

On Tue, Jul 21, 2026 at 08:41:12AM +0200, Igor Paunovic wrote:
> The HDMI RX controller can expose the audio embedded in the incoming
> HDMI stream as an ALSA capture device. Document the #sound-dai-cells
> property so that a sound card can reference the HDMI RX audio DAI.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

