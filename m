Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4F3C0A12
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182160; cv=none; b=llmR6ZFlPfLN7ARc9EEOxjny2LX2miLgnOMy2iI2Qa2sOY0lQFS2wRdQpei9aC/uHoHK+am2Qy4+ATR2kbtqsDerRcW4VAGVympHCr60kQM9IjSS1In/gBU8LJbjGpHBtQLqeGs+ogJ7BTe6danNzz3AHhSEaLY8EQtd9JZGBTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182160; c=relaxed/simple;
	bh=s5kevH0NLuyngCwzbdZ02Q9hvc/eSWK2S+XDiRftV9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPWy/cuS1YcV8CH8awGVqDAOJc7v9Ep18jWbiSK7MlWFmhXRRIrUuqJmI8pmyrK7W2752IyEl+aBUpD92gD1ihH2Ud4y5qacy6uO3rbZ7IKOjlnFl9AalAIC9RaN17dPaRmujEwjWobrkorVnspmYq31/xfkP+sq0/yM9ekie9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=khmxrYjB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="khmxrYjB"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98A4BD0;
	Thu, 11 Jun 2026 14:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781182127;
	bh=s5kevH0NLuyngCwzbdZ02Q9hvc/eSWK2S+XDiRftV9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khmxrYjBONJmr1do3TQ32jdcIQbxycx5YAe6TcNo7C3gnRsCKWQqZH/t3yhXTBbhl
	 nYVuk7nDlEpe1hlZqtAkxpps35s8cDsZWJ3dE5Mz4AMgwiFDCRgnggPJRy2TPJVnxs
	 yMix1OKGPov/UEDkCQqJ1b1KooWaLCJVOydVnw3M=
Message-ID: <65ab9804-d6ac-4110-9bed-e259195d8f26@ideasonboard.com>
Date: Thu, 11 Jun 2026 15:49:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Frank Li <Frank.li@nxp.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 18/05/2026 19:43, Sakari Ailus wrote:
> Hi folks,
> 
> This smallish set makes frame descriptors dynamically allocated and

Is there a real-life requirement for this? 8 frame-descs per pad has 
been more than enough for my uses so far.

> implements a single-entry frame descriptor based on the device's format,
> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> do not obtain their frame descriptor from upstream are converted. The

Hmm, what does this mean? Don't all the drivers modified here already 
get their frame desc from upstream? Or did you mean "all drivers that 
obtain their frame desc from upstream..."?

> helper also obtains a frame descriptor for the desired type (parallel or
> CSI-2) and checks there's at least one entry there. These checks are

What does this mean? In patch 3, the desc says "If the remote sub-device 
does not support frame descriptors, v4l2_subdev_get_frame_desc() creates 
one".

So does v4l2_subdev_get_frame_desc() just check, or does 
v4l2_subdev_get_frame_desc() implement a fallback mechanism, if the 
upstream subdev does not implement .get_frame_desc?

If it does, some of the drivers implement their own fallback. E.g. rpi 
cfe.c calls cfe_get_vc_dt_fallback() if it gets -ENOIOCTLCMD, which just 
constructs a default single-stream frame desc with virtual channel 0.

It also looks like you only modified platform drivers. Did you check the 
i2c drivers? Some call get_frame_desc().

> removed from drivers that currently perform them. (Some drivers also check
> there's exactly a single frame descriptor entry but I think in most cases
> this check could be loosened. That could be done after this set.)

Hmm, isn't that strictly tied to the multi-stream support? Or do you 
mean that frame desc could contain multiple entries, but the receiver 
would only use one (if multi-stream is not supported)?

  Tomi

