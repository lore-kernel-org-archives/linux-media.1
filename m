Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D18282F1E
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924193; cv=pass; b=i7bqG7ioQTEWVJnhwQWjIsFf7mQ2ycAPcSUD0oTK/4kdaGK4AKdRDmJOkodHXe0YF4uOrmGIZe8EW1yP6yMO6HAKc8m7wCrlVWIz4B7hIw80PtMrpdIwYzofOZF981shmH83WVhPcbOni+NeT+ZekiyaPYYH/+9pLCmDS6UF0Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924193; c=relaxed/simple;
	bh=vbarVqydOBfABJChdUGoDl6YJZbwNByy+PQhxzxqsyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpxhuqJovK8XCd+Sxuvk5LQ77rgVFTOHyezqbbuBGDubYf6oo8r3Opq3s/0Cd6je2u6na6yh4D7Mn13l3pLBmgbhBSEWuw/2dvY+Bbl9/9CrLmGFv38dawJr3W1PWLVC/ZNX9/32hQQ5+H/ZhXotBUiXWKSqtSeJMINjl/e3exw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=BYmTUTNW; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="BYmTUTNW"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hx01h2SlNzyQx;
	Fri, 02 Oct 2026 09:56:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790924184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7wZVIGg84erRveyszTRBpVaTkv5Ht3KD7WF5GsiEMtE=;
	b=BYmTUTNWlJ2E6kvqHzwMDHBaGU5VoTivD4u5Pg50DGrjGMXMZkaIP7mhEhmYuKfbzPDKNP
	XLI0/wm+0K+FJmkhvg78rZdnaf8unyIa/2mVSMasaCLNQOEecr83tayfSrDXfoRKSPVzAr
	LxsyxNKyC4Q319x4malQqGL5t9qsuYc=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790924184;
	b=t0Jvblq841Blwek5LnYz9O4BLWYN0u2Y+JUnb9BeNr57Yivrseo33q9MBeswf01nTwYph9
	adFKUcfLaA4mntVqR3oUz3tA67YiZ2Q0IWavZivxuFLwOERFERYOMLA6QPgrbaazVUVkuq
	hs0LIG798wpbxVzeKpJYIxjVO7XMzlc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790924184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7wZVIGg84erRveyszTRBpVaTkv5Ht3KD7WF5GsiEMtE=;
	b=VycpGOYqqFvnyqU+qxrnJO/CRu/Xtrh0lf/PyX/jXoUepU1/75dCKmiTkwAWrcBqcgNA5c
	Sfjg31q7E4w/DBpqF+qWKEPwG3YlZraliwaEGyzNZnt79yHaAAQXGF+cG1a73oUe+TPQm9
	ntN4x68C6OHoFWsrcYuEIlG2mlef91Q=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B1385634C51;
	Fri, 02 Oct 2026 09:56:23 +0300 (EEST)
Date: Fri, 2 Oct 2026 09:56:23 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: johannes.goede@oss.qualcomm.com,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Loic Poulain <lpoulain@qti.qualcomm.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <ar9Vlz3RyCUwW0Ia@valkosipuli.retiisi.eu>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>
 <ff4290aa-8edd-4135-9260-3bcd0361fa06@oss.qualcomm.com>
 <20261001205505.GP944070@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001205505.GP944070@killaraus.ideasonboard.com>

Hi Laurent, Hans,

On Thu, Oct 01, 2026 at 11:55:05PM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> (CC'ing Sakari who may have more insight on ACPI properties for
> Intel-based machines, or who may be able to pull the right people in
> this conversation)
> 
> On Thu, Oct 01, 2026 at 05:15:05PM +0200, johannes.goede@oss.qualcomm.com wrote:
> > Hi Stefan,
> > 
> > Thank you for the write-up.
> > 
> > On 30-Sep-26 13:18, Stefan Klug wrote:
> > 
> > <snip>
> > 
> > > ## Diving into the examples
> > > 
> > > Lets look at the example I listed to see how these would be solved.
> > > 
> > > ### 1. Laptop with camera module from various manufacturers
> > > 
> > > I believe this can be solved by either integrating the detection logic
> > > in libcamera and/or adding rules to udev/hwdb. But we are lacking real
> > > examples. So if you're able to provide identification strategies for
> > > real, existing hardware, I'd be glad to know about it. One strategy
> > > might be to use the machine identifier provided by DMI. This is however
> > > quite coarse and can not handle cases where the manufacturer used
> > > different camera modules from different vendors (using the same sensor
> > > model). ARe there for example ACPI properties that we could query for
> > > additional information?
> > > 
> > > Q: Does anyone in this group have more details on which information to
> > > query and where to get more details from the system?
> > > A: ...
> > 
> > For the Intel IPU6/IPU7 methods there is an ACPI call which the kernel
> > can do on the sensor fwnode object which will return a string identifying
> > the modules. These strings don't really have any fixed format, typically
> > they contain something which look like how some laptop serials look
> > just a random bunch of numbers + capital letters.
> 
> We know that hardware manufacturers like to have multiple providers for
> camera modules in the same laptop model in order to avoid supply chain
> issues. Do you know if this can be confirmed from those strings, do we
> have enough data to see if the identification strings are made of a
> small number of clusters ?

These strings are unique to the module. I'm afraid they could even be
module names as defined by the module vendor.

> 
> > Userspace cannot get to this without the kernel exporting it.
> > 
> > Given all the udev talk, I think a sysfs attribute would make sense
> > for this. We can make the kernel do the ACPI call and if it is present
> > add a camera_module sysfs attribute to the v4l2-subdev for the sensor,
> > which will only be visible when there actually is a module-name.
> > 
> > On laptops using devicetree we could then fill this from a devicetree
> > property.
> 
> I would very much like to standardize the API exposed to userspace
> across different types of firmwares (ACPI and DT). Having more data
> about the ACPI side could help us design DT properties that would fit
> nicely with a single API.

Note that this concerns only the Windows specific ACPI tables. DisCo for
Imaging (or older Chromebook ACPI tables following Linux specific
definitions) doesn't specify anything (largely because DT doesn't). Of
course it'd be nice to change that -- for both.

> 
> > > ### 2. Camera modules with an embedded EEPROM
> > > 
> > > To make use of the EEPROM data from user space we need to carry two
> > > elements: The EEPROM data itself and some identifier telling which
> > > format the data in the EEPROM has. This seems relatively straightforward
> > > and we could model it like this in dts:
> > > 
> > > dts-snippet:
> > > imx283_0: sensor@1a {
> > > 		compatible = "sony,imx283";
> > >     ...
> > >     eeprom = <&eeprom>;
> > >     eeprom-format = "vendor-a-eeprom-fmt";
> > > };
> > > 
> > > Getting the link to the EEPROM from user space is something to
> > > investigate. Ideas are either sysfs or media-controller.
> > > The eeprom-format must be specified as well, to tell user space how to
> > > interpret the EEPROM data, as it is typically not self-contained.
> > > 
> > > Q: On a first discussion on that topic we were unsure if it would be
> > > preferred to expose the data directly in sysfs,
> > > or to symlink to the corresponding sysfs entry for the EEPROM. Any
> > > preferences?
> > > A: ...
> > > 
> > > Q: Any input/things to consider from ACPI side?
> > > A:
> > 
> > For IPU6/IPU7 eeprom data is not used for camera-module identification
> > (AFAIK), it is all done through the (custom, Intel specific) ACPI call
> > I mentioned above.
> 
> I wouldn't expect an EEPROM, that would be quite costly for little gain.
> I wonder if sensor OTP memory is typically used though. Some sensor
> manufacturers specify how to store calibration data there, such as lens
> shading tables for instance. I wonder if anyone puts the same data in
> ACPI tables.

To my knowledge there's no tuning data in system firmware on Intel x86
systems. That could change in the future of course, but it's perhaps
unlikely, due to logistical issues.

> 
> > > Q: What happens if the EEPROM driver is not loaded yet or is just not
> > > available? Should it block/defer probing of the sensor?
> > > A:
> > > 
> > > Q: We are missing real-life examples for these cases. So input from
> > > vendors would be welcome.
> > > A:
> > <snip>
> 

-- 
Regards,

Sakari Ailus
