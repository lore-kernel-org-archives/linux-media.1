Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2643C056;
	Thu, 27 Aug 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824762; cv=none; b=e1IUS/tBjOtQOUSwCAVFkbSjDPIF5iozdBKopgAgugEYNRAl4N63G+fdZQIMmPK1RgOW1yogruIsGOdBP0ErkDuLhr12Ni5lXyXe7FwOJKwxoqAgs7xx8TnMo9LHXvqoNRYl1S3UvLgqjvY8RxqnKYSQIIesrVWS7ABM8kPtyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824762; c=relaxed/simple;
	bh=11xTUziSXOWeD1l036NtA0/JdbzanihkUFlJwi/WPnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4EGyWtJ7AkjYZr+wFOuGQOqg3yz8sVvcmnosMOPAaqyUWb/XdG0E8ZB6UqDz/SZZKHxhE8EA5NxjWMf7+Rv+yNi1hKLwtEPbnIjKCe1GzsZ/zjPdjOJMKCchusjSBLbrBXElMmmYAXE7EX88MvanS1iw1T0XePxUAfunpDpOm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7Zn/qNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7Zn/qNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2B41F000E9;
	Thu, 27 Aug 2026 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787824739;
	bh=TQj16CCr2B2MSXP+Sd9+unNSviyC1x9pzIHtFVBLCuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P7Zn/qNmLTpk8BR6IdMutbvvaCsdQMUxQ7khEQo7SvAR6Y0u/oOMTBwvpHMLlDnQx
	 DGOA8Ulon9IpHf6XIYAQPbqPgJLp315jae8GjlnbMdrz5RtV/A1yyOiET32lyLs5q5
	 NmD6Wj71JZ+TMZjIquryrb3qbD1QWof4F4oJhLOBGEeIxt9WAZAVRX8PLRbuD9AAKf
	 9+LzyhGVnFr7ZNHLClV0QYQE22MDECEmrMJvIs+QHdP822Y+i0GszS99yri7AnsBgq
	 boLYl7YMIlgtPLIsqcxH4T1zs7t9RbZdj68gnpcD3PNdML0JCCt1DvScKmwZBWNVPL
	 zDWlkghZ4HImg==
Date: Thu, 27 Aug 2026 11:58:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
Message-ID: <20260827-chubby-refined-partridge-2efca6@quoll>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260820075524.2056029-2-eagle.alexander923@gmail.com>

On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---

Plus, there was already v3 here:
<20260306103614.3208182-1-eagle.alexander923@gmail.com>

so how are we supposed to compare this?
Did you address v3 feedback in this v3+1 version?


Drop second/last, redundant "bindings". The "dt-bindings" prefix is
already stating that these are bindings.  See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof

