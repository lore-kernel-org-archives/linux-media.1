Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177F6432E6E
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421779; cv=none; b=Y8Dc4BqYMmA70HmZU4Gb6gNSzDm8+G7SLw+etMA1ZwsJTO7QXFr1hS+VyRIWdv9ionkEcbn5IL0+u3d3FSoB01OL1GdnPszakyO7AVeJ47sc2RFFJeh3zZ+x0qhS6g7viTlpkRvyLmfhIdOtZrYz//536uA8QZowEQQTgaFC038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421779; c=relaxed/simple;
	bh=oOigzFE8cSW7NvAoyH8QKBhs6vx8ClT3wg+PSk1vvfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhSkPBq0/3z7NVhFyG5MqHkrNlVaP7O3B8XtQ8s1Yz9XXuLGMlz6trpd20pFtVdidhmjxMRHY7JBb6wVjkReawAlcyPohRdj5R3r+/9pz8va9FVTOTVhKNPepX1e61L77ozvkOBzSbAMEKdzYGSLBAI5nSl7KV4heET9XUCe0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bjZ2LupO; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bjZ2LupO"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e512a9a6bso119712585a.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785421777; x=1786026577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLuDWzkdFzjpqoqsjchrCSg06GWM4x3fBl0egSKnDDQ=;
        b=bjZ2LupOOWnKcQJQI+uFcT5eTm1Xsgq4UJUz5owFXKlPhmNa1co6NFRTbXGVd3TvQE
         KFBtdyqJsDYfPD9GYNN5M68BpxgPG4bqFfvquTJ4GUKFqvntlp/yjzrtifVLe2R3lMX4
         BAZcaj6ebbSlByCK20xEFp9SlWZh4E1nkCX9XyGSGAtMTZ+/W4aIGSHdLXEZsf0g8p7s
         ioCRFK8H8ZrwZYVtp5dTt/+lmM+ZaNCDHsQCdkjW/LTdEqiGkkAWzeHlcr6xGzW0bmUK
         VEwR7M4CXLNw2Ouko1/5RcyBAmWPRxNGoaJrDTnsVKcrXCIeuzQ1XoC0OIcahjCX32Te
         9GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421777; x=1786026577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLuDWzkdFzjpqoqsjchrCSg06GWM4x3fBl0egSKnDDQ=;
        b=Y0SrUCoaZ0rH19AFytAa9TqQ3B2DXrk6yqCyDsKgoMeC45rJ4GidLiw96s4QRl3Jzn
         Janhioy2c4jQbl/8IrtgBkVxqvXdd8wfsw0m/bwMtfutbtVouY/ci4CzSGTjg7Cg1fZI
         oyegAI4D12wbLcM31IAZePcZdSPDFkB0NNN1bjcMGR/vH3xvMpkIxGE4vjlHL5kURe7D
         S5MUVAqBhbQnGAq9PD4FVOwtzD/21X+6WILRAu/BlcegMkzRm532QuA6Pz/jZmuTv4XJ
         PR9I4KTb5tksp7LBmZtQoeVBg+1a17+Her//yMryNlHhIBRcozMyq87d7JhFJmaMWp6N
         g9/w==
X-Forwarded-Encrypted: i=1; AHgh+RoDTixvpzsb9A2HBGM2G9oyonG0XMgtQzH0rq4/s6ZzAgZm9YgSonsnk2/ez4pvlcVqrcK+/p62Y7uiRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5tccFKc3bvAIRcWXu3ofgdB2RzyuHNt3BcHF8dJCale/BLAe
	RiMKTV53ix2+JUSdjY5hh8KJ2QeV6x+ef7PgVl/fxQxfBnPZlGDDwCcF+eQNlI7e4g==
X-Gm-Gg: AR+sD13A31+JBztCSd8OCQA0HWVshRnJK6WoxfIKMA8Q/I5A8vyQfYr9rs5rtDHDFAd
	Uu23j82yTAyIVkfoZdPlgGvXe7euBQWnGJPDS51Z++0VO90nLAw7xcANxMq2Vj8KVFm7pfFHj9j
	Ms4FW3+ZtWGdFkWa6ZKBOI3Zy+fPIghF96lownYGZ7HN4HBg6ClP68PcREMU05X43Zd9+FJbr1R
	XPm0wBaNSuQ/0UF5ZatJigyqJXSjYRtINEeioT2TIjcftCUE5kA3SFN0BcEHWWj4iNjm/lSeFsh
	zwvNNrPx1riGL5O4apC/WvujmPGq2wDhINkvkj3y3LRv6OTfULimJs/BxfizOac3e6hr+k/sS6K
	T6U7g6CSovpIZlvMtBEoBnIVXUZoPB++95f2WejqAY6YR5RFRrEPW2fEaIPpT/f4v/u+6WipKr/
	u++Mao8IghhoR4J9v2siC9hRBbJxLvyAum/W4W9h1y5H9fX/cOaD0xyAAOO2ekr7KyeP11AKLIc
	UJ6mJ9K6yXUZUvpblw=
X-Received: by 2002:a05:620a:7112:b0:92e:c117:5ed6 with SMTP id af79cd13be357-9348722049emr283801085a.86.1785421776676;
        Thu, 30 Jul 2026 07:29:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933c757bafdsm425028285a.0.2026.07.30.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:29:36 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:29:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Haowen Tu <tuhaowen@uniontech.com>, hansg@kernel.org,
	gregkh@linuxfoundation.org, kernel@uniontech.com, lenb@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	mchehab@kernel.org, oneukum@suse.com, pavel@kernel.org,
	rafael@kernel.org
Subject: Re: [PATCH v4 4/4] media: uvcvideo: defer streaming restart after
 hibernation snapshot
Message-ID: <a1f8d865-531c-4f30-85c1-735254940763@rowland.harvard.edu>
References: <cbac4803-cf65-4b8b-a662-073189df478b@kernel.org>
 <20260729075655.1187692-1-tuhaowen@uniontech.com>
 <0e22e9d4-da39-4d3f-9492-5c74295be312@rowland.harvard.edu>
 <20260730131628.GA1555789@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730131628.GA1555789@killaraus.ideasonboard.com>

On Thu, Jul 30, 2026 at 04:16:28PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 29, 2026 at 10:08:51AM -0400, Alan Stern wrote:
> > On Wed, Jul 29, 2026 at 03:56:55PM +0800, Haowen Tu wrote:
> > > On Wed, Jul 29, 2026 at 09:29:03AM +0200, Hans de Goede wrote:
> > > > Right, so the purpose here is to avoid the LED turning back on and
> > > > to speedup the hibernate?
> > > >
> > > > IOW except for the LED turning back on and things taking slightly
> > > > longer everything works correctly with the current code, right ?
> > > 
> > > Yes, the current code is functionally correct in the sense that the
> > > hibernation flow can complete and the camera can be restored afterwards.
> > > 
> > > The issue was reported as a user-visible privacy concern.  When an active
> > > UVC camera enters hibernation, the camera LED turns off during the freeze
> > > phase but turns back on after the snapshot has been created, while the
> > > system is writing the hibernation image.  From the user's point of view,
> > > this looks like the camera has been activated again during the
> > > hibernation transition.
> > > 
> > > I am not claiming that this causes image data to be exposed.  The problem
> > > is the unnecessary hardware reactivation and the resulting unexpected
> > > privacy-indicator behavior during a system power transition.
> > > 
> > > Avoiding the restart also avoids unnecessary device work in this window,
> > > but I do not intend to make performance the main argument here.  The
> > > primary goal is to avoid the unexpected camera reactivation.
> > > 
> > > > I'm wondering if it would not be better to solve this in userspace
> > > > and have userspace stop the streaming before hibernation ?
> > > 
> > > That would help when all userspace camera users cooperate, but I don't
> > > think it is equivalent to handling this in the driver.
> > > 
> > > UVC is a generic driver and the kernel PM transition can happen while an
> > > application is actively streaming.  Relying on every userspace camera
> > > consumer to stop streaming before hibernation would make the behavior
> > > depend on userspace policy and application support.  The driver already
> > > knows whether streaming was active at freeze time, and it is also the
> > > component that restarts the hardware during resume, so it can avoid this
> > > specific unnecessary hardware restart more reliably.
> > > 
> > > > Hmm, the way you word this sound like this is a problem at the USB
> > > > layer. But I think this is more of a short-coming in the generic
> > > > device model.
> > > >
> > > > To clarify AFAIK the actual USB device to which the interfaces belong
> > > > also does not get a specific PM message here, right ?
> > > >
> > > > The reason I'm asking is because the way this is worded in the commit
> > > > message makes it sounds like this might be something which could
> > > > be solved in the USB subsystem which I do not think is the case ?
> > > 
> > > Yes, that is my understanding as well.  The USB device resume path does
> > > not expose the specific PM transition type to the UVC interface driver's
> > > resume callback.
> > > 
> > > The problem was observed in UVC, and the immediate reason there is that
> > > the UVC resume path is reached through usb_driver.resume(), which does
> > > not receive the PM event.  But I agree that this should not be worded as
> > > a USB subsystem bug.
> > > 
> > > My earlier thought was to expose the THAW/RESTORE distinction through
> > > USB, but that would still need coordination with the PM core, and it
> > > would only cover USB drivers.  If other non-USB drivers have similar
> > > device-specific reasons to avoid work during the post-snapshot THAW
> > > phase, they would need their own handling too.
> > > 
> > > So I can reword the commit message to avoid implying that this is a USB
> > > core issue.  Something like:
> > > 
> > >   Some resume callback paths, including the UVC path through
> > >   usb_driver.resume(), do not receive the PM event and therefore cannot
> > >   distinguish the transient post-snapshot THAW phase from the later
> > >   RESTORE phase using their local callback arguments.
> > > 
> > > The helper is intended to expose only the hibernation snapshot state.
> > > Whether it is safe or useful to defer any work remains a driver-specific
> > > decision.
> > 
> > You're missing an important fact: If something goes wrong during the 
> > hibernation transition (for example, if the kernel's memory image can't 
> > be stored to disk) then there will be no RESTORE phase.  Following the 
> > THAW phase, the system will return to normal operation.
> > 
> > For this reason, during THAW drivers must not assume that the system is 
> > about to power down.
> 
> All of this seems fairly complicated to me for devices that have no role
> to play whatsoever in the hibernation image write, and that's probably
> the majority of devices.
> 
> Is there a reason a driver couldn't set a flag at probe time to tell the
> device doesn't care about hibernation, and have the PM core skip the
> resume in the THAW phase, instead resuming only when THAW fails ?

You mean adding an extra THAW phase to the hibernation transition, which 
gets triggered only when writing the memory image fails, and which 
affects only drivers having this new flag set?  And as a result, when 
hibernation succeeds these drivers would see a FREEZE callback followed 
directly by a POWEROFF callback (unless the flag causes POWEROFF to be 
skipped as well)?

Another thing to be aware of is what happens while waking up from 
hibernation, if the memory image can't be restored.  In that case the 
restore kernel would send THAW callbacks to all drivers before 
continuing, and presumably you wouldn't want this callback to be 
skipped.

That seems like it could be feasible, but the decision is up to Rafael.

Alan Stern


