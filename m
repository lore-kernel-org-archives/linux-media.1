Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824FD336EE9;
	Fri, 20 Feb 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583285; cv=none; b=IgsBVGI24EkJy0Y05B4CSt/CSqCYsYpr4JeuQur6TFJg8Te7o5c9bqD3LJKLNo+cgeWtFz5io1Re3Qlt4vBp+pYq79lTJzvrntkA+hkDoZQJ3ejF7fSm5ZLm8t2uBC5bTo3ZwUjwi1kuenw5Vrsp+mjN+EGgJYB8oUqorINHNig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583285; c=relaxed/simple;
	bh=nzZKlsLlMJHkaNGIbyKq9ZWB0SMh+QudkzPSCCkwyJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE+9RNVVuS/oMvj95g8qNCZO3ZzS75iTTKMDUSTRamTDjWwDabIvG2eAhafgdrSzmgOa7uTkHu5TiJSBfvpJ87rFTjbFHz0gNRdty0BA8WF0RKgcXU+zxGGAK+rXQDN2f/OhRzwacBT3Z02owRQUXfwbYxEkC8WZFPK1RcOzw/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CPX0LF9j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CPX0LF9j"
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6368379;
	Fri, 20 Feb 2026 11:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771583219;
	bh=nzZKlsLlMJHkaNGIbyKq9ZWB0SMh+QudkzPSCCkwyJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPX0LF9jatIPQ9uog06GRKU0/DQLtNp3q+EUdz7zdlGF0nF+6RpQqBR1kjFMywNO3
	 MhSni+ph8ZY+RhywfYJ4+IwwDt3hP4tq4NsHn/7y7VKsWOm+L02Dzvk/cyfvig8g3F
	 8f14MWZZMr6yesn0fP5Xa2SQt7YGAZnPHNsB2lTI=
Date: Fri, 20 Feb 2026 11:27:49 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Jayesh Puri <jayeshkpuri@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Modified uvc_driver
Message-ID: <20260220102749.GC1619026@killaraus.ideasonboard.com>
References: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
 <20260219133206.GM520738@killaraus.ideasonboard.com>
 <def15d99-a2a6-4aaf-9ab5-bac1167c3476@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <def15d99-a2a6-4aaf-9ab5-bac1167c3476@linuxfoundation.org>

On Thu, Feb 19, 2026 at 01:24:23PM -0700, Shuah Khan wrote:
> On 2/19/26 06:32, Laurent Pinchart wrote:
> > On Thu, Feb 19, 2026 at 06:48:11PM +0530, Jayesh Puri wrote:
> >> ---
> >>   Kconfig                            | 0
> >>   drivers/media/usb/uvc/uvc_driver.c | 2 ++
> >>   2 files changed, 2 insertions(+)
> >>   mode change 100644 => 100755 Kconfig
> >>
> >> diff --git a/Kconfig b/Kconfig
> >> old mode 100644
> >> new mode 100755
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >> index aa3e8d295e0f..cec117328ab2 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -2191,6 +2191,8 @@ static int uvc_probe(struct usb_interface *intf,
> >>   		(const struct uvc_device_info *)id->driver_info;
> >>   	int function;
> >>   	int ret;
> >> +	
> >> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
> > 
> > Congratulations, but I'm afraid we're out of medals.
> > 
> > Shuah, I thought LFD103 has been updated to avoid spamming the lists
> > with such patches. What happened ?
> 
> It is changed a while back - not sure what's going on.

Could you please investigate ?

-- 
Regards,

Laurent Pinchart
