Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A42DCC13;
	Fri, 20 Feb 2026 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603999; cv=none; b=jEn+COEuQmp+dRRFvdKYKJFzQ4TFkNAs+n13E8aq1Rnj13aSNyYqoyS/2aULgN1THuzgPADwIuCEY1OnnKJ0abPa9VU2oknve9I8XHmJPu+9VxrsVeRNL25SShMQB4t4QinG1OxvG4oL+DbniAT0t5tQplGP7zcZIUr0xWFT01g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603999; c=relaxed/simple;
	bh=D5Xcab8LkldOjE6Ym/1dEnYrsvh3/PVT6TtfS+6aZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+BB5wXTd7gfU6n2AKuHW21EInficCasPt3T57ugtIfPhP0HPtCb+yKVk8aWoVVtJNYZXOJ4JjusrFgOhI/chUaNFHU35ql4G65FjpsZz0pGqLhQMLF5SOhUvlgz8JzNpGWcfwlLRY5ZciBCAVmUPQOFmcGjOqkJI4S2JanD3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bq6ge/gh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bq6ge/gh"
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F3715502;
	Fri, 20 Feb 2026 17:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771603941;
	bh=D5Xcab8LkldOjE6Ym/1dEnYrsvh3/PVT6TtfS+6aZVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bq6ge/ghPCTyO1y053uJRgHaGwPydU53B2EIifA88B4wCb2GfoCcpZBhKyOpMpfe4
	 +vjlYC2h/chrxrPaeqVu5JfgR9dJIyi0f7VRkJ6sQr7IlknlqiT8lM59+4f8rgUxXW
	 agwVVPaqSoejuz8FNj/g0sr02F5woQHqQRcOWxYU=
Date: Fri, 20 Feb 2026 17:13:11 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Jayesh Puri <jayeshkpuri@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Modified uvc_driver
Message-ID: <20260220161311.GF1619026@killaraus.ideasonboard.com>
References: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
 <20260219133206.GM520738@killaraus.ideasonboard.com>
 <def15d99-a2a6-4aaf-9ab5-bac1167c3476@linuxfoundation.org>
 <20260220102749.GC1619026@killaraus.ideasonboard.com>
 <4cb7125d-8023-4719-96e0-8322e4c6a241@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cb7125d-8023-4719-96e0-8322e4c6a241@linuxfoundation.org>

On Fri, Feb 20, 2026 at 08:49:47AM -0700, Shuah Khan wrote:
> On 2/20/26 03:27, Laurent Pinchart wrote:
> > On Thu, Feb 19, 2026 at 01:24:23PM -0700, Shuah Khan wrote:
> >> On 2/19/26 06:32, Laurent Pinchart wrote:
> >>> On Thu, Feb 19, 2026 at 06:48:11PM +0530, Jayesh Puri wrote:
> >>>> ---
> >>>>    Kconfig                            | 0
> >>>>    drivers/media/usb/uvc/uvc_driver.c | 2 ++
> >>>>    2 files changed, 2 insertions(+)
> >>>>    mode change 100644 => 100755 Kconfig
> >>>>
> >>>> diff --git a/Kconfig b/Kconfig
> >>>> old mode 100644
> >>>> new mode 100755
> >>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >>>> index aa3e8d295e0f..cec117328ab2 100644
> >>>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>>> @@ -2191,6 +2191,8 @@ static int uvc_probe(struct usb_interface *intf,
> >>>>    		(const struct uvc_device_info *)id->driver_info;
> >>>>    	int function;
> >>>>    	int ret;
> >>>> +	
> >>>> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
> >>>
> >>> Congratulations, but I'm afraid we're out of medals.
> >>>
> >>> Shuah, I thought LFD103 has been updated to avoid spamming the lists
> >>> with such patches. What happened ?
> >>
> >> It is changed a while back - not sure what's going on.
> > 
> > Could you please investigate ?
> 
> I will look into it

Thank you.

Jayesh, I assume this conversation took you by surprise, so I'll provide
a bit of context. LFD103 used to provide instructions on how to modify a
driver, create a patch and send it to a mailing list. Those instructions
were then followed by a line to tell the reader to not actually run the
commands. Unsurprisingly, that line was often overlooked, and patches
such as this one spammed the list.

I got a bit fed up and reported the issue to Shuah, who ensured LFD103
would be improved to avoid the problem. That was months ago, so I'm
surprised to see the issue occurring again. If you've followed the old
LFD103, I'm blaming the original wording of the course, not you, for the
problem.

-- 
Regards,

Laurent Pinchart
