Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8930566A
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888113; cv=none; b=ARVZMWLmTS0uGc4GMAIsU9fEBrlw/dnXVlZ4kgiKPtgr+owjbvhhkw97qxIO33UvRrT6PZh4hWQpLEirjmtzQX9HoUJ+1AmK5kHJNE0oudVRdIzdGelrJfAUgQZrQ1ZtGhGkatoIvzwdIjD1xEiJ0vlehtXliLuk4grlQhhSoNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888113; c=relaxed/simple;
	bh=RXtnSyLViNWaRrk80hQCVmZ1Srg9NDyBPVE2dWNKMNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncqfQMKpZZPGvoKwGdUcOUkIRz9bSlpn5aVCcpjVg06hHBQX/dqAkbAZJuaVomnZf4DAjASfInyYvFEPI7MbHkkAXb6QYG9X5s1BoQEM5VSNYiy9PElxc2lIg4x90qGvqvO5UgopgX2pA5QxTyXe36xdnAsFzZaDO9DZyoTIZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y4cHfW/Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y4cHfW/Z"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44CC8593;
	Thu,  1 Oct 2026 22:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790887994;
	bh=RXtnSyLViNWaRrk80hQCVmZ1Srg9NDyBPVE2dWNKMNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4cHfW/Zod0MHpP8yWLf/Imu+ji1hUlXhHVNjMhKWv0A+Pn8pXs45Xd6yYhkuGMKQ
	 LIhSCpogdyR9MFUmaH/eZLhg5lCQyfXT6VXThZckuYHipooipbWvuD+k64+lidhKka
	 LSSQXhTxRPsXu6FDwxKtl2wVtAgtPy4drlrBAGHY=
Date: Thu, 1 Oct 2026 23:55:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: johannes.goede@oss.qualcomm.com
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Loic Poulain <lpoulain@qti.qualcomm.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20261001205505.GP944070@killaraus.ideasonboard.com>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>
 <ff4290aa-8edd-4135-9260-3bcd0361fa06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff4290aa-8edd-4135-9260-3bcd0361fa06@oss.qualcomm.com>

Hi Hans,

(CC'ing Sakari who may have more insight on ACPI properties for
Intel-based machines, or who may be able to pull the right people in
this conversation)

On Thu, Oct 01, 2026 at 05:15:05PM +0200, johannes.goede@oss.qualcomm.com wrote:
> Hi Stefan,
> 
> Thank you for the write-up.
> 
> On 30-Sep-26 13:18, Stefan Klug wrote:
> 
> <snip>
> 
> > ## Diving into the examples
> > 
> > Lets look at the example I listed to see how these would be solved.
> > 
> > ### 1. Laptop with camera module from various manufacturers
> > 
> > I believe this can be solved by either integrating the detection logic
> > in libcamera and/or adding rules to udev/hwdb. But we are lacking real
> > examples. So if you're able to provide identification strategies for
> > real, existing hardware, I'd be glad to know about it. One strategy
> > might be to use the machine identifier provided by DMI. This is however
> > quite coarse and can not handle cases where the manufacturer used
> > different camera modules from different vendors (using the same sensor
> > model). ARe there for example ACPI properties that we could query for
> > additional information?
> > 
> > Q: Does anyone in this group have more details on which information to
> > query and where to get more details from the system?
> > A: ...
> 
> For the Intel IPU6/IPU7 methods there is an ACPI call which the kernel
> can do on the sensor fwnode object which will return a string identifying
> the modules. These strings don't really have any fixed format, typically
> they contain something which look like how some laptop serials look
> just a random bunch of numbers + capital letters.

We know that hardware manufacturers like to have multiple providers for
camera modules in the same laptop model in order to avoid supply chain
issues. Do you know if this can be confirmed from those strings, do we
have enough data to see if the identification strings are made of a
small number of clusters ?

> Userspace cannot get to this without the kernel exporting it.
> 
> Given all the udev talk, I think a sysfs attribute would make sense
> for this. We can make the kernel do the ACPI call and if it is present
> add a camera_module sysfs attribute to the v4l2-subdev for the sensor,
> which will only be visible when there actually is a module-name.
> 
> On laptops using devicetree we could then fill this from a devicetree
> property.

I would very much like to standardize the API exposed to userspace
across different types of firmwares (ACPI and DT). Having more data
about the ACPI side could help us design DT properties that would fit
nicely with a single API.

> > ### 2. Camera modules with an embedded EEPROM
> > 
> > To make use of the EEPROM data from user space we need to carry two
> > elements: The EEPROM data itself and some identifier telling which
> > format the data in the EEPROM has. This seems relatively straightforward
> > and we could model it like this in dts:
> > 
> > dts-snippet:
> > imx283_0: sensor@1a {
> > 		compatible = "sony,imx283";
> >     ...
> >     eeprom = <&eeprom>;
> >     eeprom-format = "vendor-a-eeprom-fmt";
> > };
> > 
> > Getting the link to the EEPROM from user space is something to
> > investigate. Ideas are either sysfs or media-controller.
> > The eeprom-format must be specified as well, to tell user space how to
> > interpret the EEPROM data, as it is typically not self-contained.
> > 
> > Q: On a first discussion on that topic we were unsure if it would be
> > preferred to expose the data directly in sysfs,
> > or to symlink to the corresponding sysfs entry for the EEPROM. Any
> > preferences?
> > A: ...
> > 
> > Q: Any input/things to consider from ACPI side?
> > A:
> 
> For IPU6/IPU7 eeprom data is not used for camera-module identification
> (AFAIK), it is all done through the (custom, Intel specific) ACPI call
> I mentioned above.

I wouldn't expect an EEPROM, that would be quite costly for little gain.
I wonder if sensor OTP memory is typically used though. Some sensor
manufacturers specify how to store calibration data there, such as lens
shading tables for instance. I wonder if anyone puts the same data in
ACPI tables.

> > Q: What happens if the EEPROM driver is not loaded yet or is just not
> > available? Should it block/defer probing of the sensor?
> > A:
> > 
> > Q: We are missing real-life examples for these cases. So input from
> > vendors would be welcome.
> > A:
> <snip>

-- 
Regards,

Laurent Pinchart
