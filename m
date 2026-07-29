Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943C4BC003
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334142; cv=none; b=YesE+7ZMZr6I1rsi7LwL/TlUIdeTueY+8IrailcFX70IhQlZWEOuCcek34Ex3K19zSSFrnuRxfBVLnJ0UiAgQVaIGFlCf2PpHoHNci1ukM8fMYoy5k+qwQu0oRXCXCBG1C7VytKRUn+qCHxudEvEExNscnZ4ouUx+gX3dgPdaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334142; c=relaxed/simple;
	bh=/67HQpFAEKtmh7pBdA3FLDCKv9mMdJ7V2q7+FUwXbd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD7FJSeAUQX8hg8JFqPhUnSmhAnswgknuUcX68pBH8HBpsMCJHGkoXMlBqAkL3TvDkdGtHiKR2K0FTk16AFS/CrA0Sp99+NfyNdF7ra/aa2OJRBojYaA7N+7ftGc7tYXamvw619x5uHC1WaIwfq5CRhGDpvRrHvqCFtoEPfci9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fc5HPDSA; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fc5HPDSA"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e54f8c051so54004285a.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785334137; x=1785938937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QoSZbcsZXIA21iiTaWUMCP3YKzXreBNCKDmjiwMa46E=;
        b=fc5HPDSAElfoSoHh+f7ML8gc7houZbNcc++y5+dTQI+inYS6W7Rc9GelL8uJVg9bYq
         EF/Jdugz7g+8ihesTro33kfsM3wpCL1YOk4az52IsZ67ET7M3ZQjuMdBToudr0iYiWht
         3rXef8fuPZr6pIVDqQYPKg6SR+OJxIX7wYbVc5n/NqDfLtBUhnQ4QfNMvDJNx1f7Og1O
         RIx1Ncz1eJLfErxFjcbCKaj4pzoqnj3Kuq5qjvuf8IBanetkJ8mjTln/TQLgERwjeNCo
         WDLz4np5Cl7Uu1np5XQ4hoNizl2iZ/XI2ViNPuiZ3BcOPwj7wwqJF5w6EHjXAIIKWhnZ
         eeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334137; x=1785938937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoSZbcsZXIA21iiTaWUMCP3YKzXreBNCKDmjiwMa46E=;
        b=IIUfiid4oxKxOiDG/ZPgis894xjOKoK67PcOiZtdS53mEhwKSJ0TxW7nwo5n1tt+nI
         USeR0DeVShyevwm5zK7EPzUSN/EiquKgxbQG86WaYFiW4eDxFy6Wisdtm1dXkZQ+V0Z3
         Tmm5WXjVWQaxFSZvoim3jKn51iDWU6s32nPCf71vNZj+F/NfWyWGCjd/n6HdjXgwcFrR
         tRVwpXmIIJfq567eylQOSSD5gp0DiYxDn/n4EmBw6X1JbVCo3luNuIDKZo8VWdCuSAQi
         TwtOqiMSlewA8u6K1HHBWmBXyFlgYqE8iV7Mn6CyXXvgacdyLT+DeC5OWiux+m7N3kA2
         LQPA==
X-Forwarded-Encrypted: i=1; AHgh+RqhPlST9Q3YbW71xrU29YD0TGo7QFkY16Vu0VU0N5Jv+BtAd6jn+ztqoKB1CCr+gHZhpQF5lcUvqHn9Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWH3JdZfgOO0WGWM76Vp4W70BtMe9utTtTvXKoX9KuXgQSW2m
	cz/uSSsHg5F7ZpuAba/V//CAYQx6sGUBS/aUNn8g6LNJAgz568y9Lo+1OlR5xGSxUg==
X-Gm-Gg: AR+sD11TMiEkeCTt+GwfMZ2BKFMgNNpPQdxuO6IELPWb3Yq8mF3iypc1ii59cxsd7kQ
	SYgPY4FzDaPZuTdVO4cgkKeMWszZTSoFiJ0yFfqqsc4cCL29kkTZuMvx0irHh8SISoT2awV7NM+
	4L8KH9VEq4PhcMz+vkzoshfhe69KkQLAhr3U3lW6xgPh1C2377YRY7FQdYtJNr5du7nOtEY6fZ4
	SiiZfzsV4CAU1P+QcYiUEYrKigDEGTqNctJSmcpgFfjNXP1TQ5TOyPDZYHfySbIWLBNFzvzw3cP
	I94neTQKOyZc06WNHZ3MV+UZ2EHiOAAqvuDWN6pmP/j7H2k0Yg1rrRnkmFjSHJcnwPHZZs0+TmB
	8Pva7L5ifsX/4NhW5iHSXz4V9qD2XipmLxQ5hWkHynnlaCM6jQAOFPjipL/tZkEVxO7pbtFU0QQ
	nJI1v537q/dBi+ZZOagFIlegLV8a0gnYWAvQ1VC64RCePLQV+0owvW5NoF36Y9sOfLoXvKz/INf
	n+ssjmPDeA3qvQdwg==
X-Received: by 2002:a05:620a:6cca:b0:931:62d:6c3e with SMTP id af79cd13be357-933026a88eemr685715385a.86.1785334134953;
        Wed, 29 Jul 2026 07:08:54 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e712fc05sm174197385a.29.2026.07.29.07.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:08:54 -0700 (PDT)
Date: Wed, 29 Jul 2026 10:08:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, kernel@uniontech.com,
	laurent.pinchart@ideasonboard.com, lenb@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	mchehab@kernel.org, oneukum@suse.com, pavel@kernel.org,
	rafael@kernel.org
Subject: Re: [PATCH v4 4/4] media: uvcvideo: defer streaming restart after
 hibernation snapshot
Message-ID: <0e22e9d4-da39-4d3f-9492-5c74295be312@rowland.harvard.edu>
References: <cbac4803-cf65-4b8b-a662-073189df478b@kernel.org>
 <20260729075655.1187692-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729075655.1187692-1-tuhaowen@uniontech.com>

On Wed, Jul 29, 2026 at 03:56:55PM +0800, Haowen Tu wrote:
> Hi Hans,
> 
> On Wed, Jul 29, 2026 at 09:29:03AM +0200, Hans de Goede wrote:
> > Right, so the purpose here is to avoid the LED turning back on and
> > to speedup the hibernate?
> >
> > IOW except for the LED turning back on and things taking slightly
> > longer everything works correctly with the current code, right ?
> 
> Yes, the current code is functionally correct in the sense that the
> hibernation flow can complete and the camera can be restored afterwards.
> 
> The issue was reported as a user-visible privacy concern.  When an active
> UVC camera enters hibernation, the camera LED turns off during the freeze
> phase but turns back on after the snapshot has been created, while the
> system is writing the hibernation image.  From the user's point of view,
> this looks like the camera has been activated again during the
> hibernation transition.
> 
> I am not claiming that this causes image data to be exposed.  The problem
> is the unnecessary hardware reactivation and the resulting unexpected
> privacy-indicator behavior during a system power transition.
> 
> Avoiding the restart also avoids unnecessary device work in this window,
> but I do not intend to make performance the main argument here.  The
> primary goal is to avoid the unexpected camera reactivation.
> 
> > I'm wondering if it would not be better to solve this in userspace
> > and have userspace stop the streaming before hibernation ?
> 
> That would help when all userspace camera users cooperate, but I don't
> think it is equivalent to handling this in the driver.
> 
> UVC is a generic driver and the kernel PM transition can happen while an
> application is actively streaming.  Relying on every userspace camera
> consumer to stop streaming before hibernation would make the behavior
> depend on userspace policy and application support.  The driver already
> knows whether streaming was active at freeze time, and it is also the
> component that restarts the hardware during resume, so it can avoid this
> specific unnecessary hardware restart more reliably.
> 
> > Hmm, the way you word this sound like this is a problem at the USB
> > layer. But I think this is more of a short-coming in the generic
> > device model.
> >
> > To clarify AFAIK the actual USB device to which the interfaces belong
> > also does not get a specific PM message here, right ?
> >
> > The reason I'm asking is because the way this is worded in the commit
> > message makes it sounds like this might be something which could
> > be solved in the USB subsystem which I do not think is the case ?
> 
> Yes, that is my understanding as well.  The USB device resume path does
> not expose the specific PM transition type to the UVC interface driver's
> resume callback.
> 
> The problem was observed in UVC, and the immediate reason there is that
> the UVC resume path is reached through usb_driver.resume(), which does
> not receive the PM event.  But I agree that this should not be worded as
> a USB subsystem bug.
> 
> My earlier thought was to expose the THAW/RESTORE distinction through
> USB, but that would still need coordination with the PM core, and it
> would only cover USB drivers.  If other non-USB drivers have similar
> device-specific reasons to avoid work during the post-snapshot THAW
> phase, they would need their own handling too.
> 
> So I can reword the commit message to avoid implying that this is a USB
> core issue.  Something like:
> 
>   Some resume callback paths, including the UVC path through
>   usb_driver.resume(), do not receive the PM event and therefore cannot
>   distinguish the transient post-snapshot THAW phase from the later
>   RESTORE phase using their local callback arguments.
> 
> The helper is intended to expose only the hibernation snapshot state.
> Whether it is safe or useful to defer any work remains a driver-specific
> decision.

You're missing an important fact: If something goes wrong during the 
hibernation transition (for example, if the kernel's memory image can't 
be stored to disk) then there will be no RESTORE phase.  Following the 
THAW phase, the system will return to normal operation.

For this reason, during THAW drivers must not assume that the system is 
about to power down.

Alan Stern
