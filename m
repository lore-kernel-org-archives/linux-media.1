Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029335F5F4;
	Sat, 25 Apr 2026 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777110142; cv=none; b=IFAFaia+TdvmSJCb63h3lVrOtKCUXF0CynTh3t7Iu8F6GpQjN0NKqx+MDTSqMZRSabrrvM0tZ7TyPCiFYOR1v22Ep9r4rRLGKYq8dJB5hTXpq6c8e0QOWAFE/EomFDcoilU/rWw264uIf52FmsMuI1bpaJxqPVze81YOYQYHaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777110142; c=relaxed/simple;
	bh=iNjb9NKjwNxC358P/kLiEG6TCoz/9jcBB1BaIFlAJqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i67jbpvbUiULqOfpCVH13qvNE70H3dsUmmChzj3gxWlHZHMhfct+OFKQGtmzpepYKDGJnjxfP5NWaGbsTOcFUZaVBeFn2Kniz22MbAtb2kcRGfdJXoLCrF5pn3vyVhaBsEJ0CJGRxrVipeogCRnU5zEO1/22QXk4aKanC0HvloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfSbxSxp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfSbxSxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B169C2BCB0;
	Sat, 25 Apr 2026 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110142;
	bh=iNjb9NKjwNxC358P/kLiEG6TCoz/9jcBB1BaIFlAJqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfSbxSxpfe9ssXCqlU9jtADH+iwewVwwlZYNBEvfnTHmOdRPQ67uGL7HQT6ATM3l/
	 6NGUMqVZiup4Ces+N6KGEJM4/d2gSJaxplJKc+pWgixOQG0fua541JkYb1RhVWTLdv
	 V0EMML++DgIhMa4iLGcxcZVxQqwjZS4uOo+rUr86EXAhkAcGeGs8LWtHy+NsvzNXO7
	 KZzuQtgZyL6dFZwMd5CmcFa9cKwbQhKSURNvrEOa5vMD1KBmnL9/l/s78hsjGoAPYM
	 vp2SaDGTgYERfLrcu86RSxJnRpzLECaR1hrn05kj4nVyFg5j5DifrLOmLuGeZb30sQ
	 X/aUJZVFMOemg==
Date: Sat, 25 Apr 2026 11:42:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Message-ID: <20260425-stalwart-albatross-of-efficiency-22f1cd@quoll>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <aeteuimzPdmE1rTB@kekkonen.localdomain>
 <MA0P287MB2178960461C59823080DD463882B2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA0P287MB2178960461C59823080DD463882B2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>

On Fri, Apr 24, 2026 at 01:28:43PM +0000, Elgin Perumbilly wrote:
> Hi Sakari,
>  
> > On Fri, Apr 24, 2026 at 02:55:44PM +0530, Elgin Perumbilly wrote:
> > > Patch 1/3:
> > > - Drop the fixed data-lanes property, as the sensor supports only a 2-lane MIPI interface.
> >
> > Does it really say that in the datasheet? To me this looks like a driver
> > property.
>  
> Yes, I have checked this. The sensor supports only a 2-lane MIPI interface.
>  
> There is no explicit statement in the datasheet saying that 1-lane mode is
> unsupported. However, after reviewing all available registers, I did not find
> any configuration that allows switching to a 1-lane mode.
>  
> Additionally, the datasheet provides no indication or guidance for 1-lane
> operation. Based on this, I conclude that the sensor does not support a
> 1-lane configuration.
>  
> If you still prefer, I can keep the data-lanes property as is and not drop it.

To me it feels like only 2-lane is supported, so fine by me.

Best regards,
Krzysztof

