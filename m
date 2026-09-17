Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D493E0230
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632284; cv=none; b=bdZjUpMBkTbOQV6oFmtrSL5eNmVRxFUEenwceKnLq34mNOFaEiB9VUSn/Qrpqeb7cbLdW7zq3d7OZ0uqAicCtBCZc9giu2tP5qxPlj610DzNWmxof9Dn0egQTysVoRxh7uOOrfz85qMWXK7JquMkTdaVfKdBS7r4kcXIXXWpYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632284; c=relaxed/simple;
	bh=3qEomJY3fM8Nt+pslnkVMCCgt97tG0uoUSvnvVNUdhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxapFT45mQSRYEJz8/KzdqJp9o5tmDepiiizolDy6fsMtsuEOfuCCs/iMaRiAm03snBYfbBqi8F7jWZDMVZzI1jkWfgiOFT38Xe6FlqICvuYikzig6AH3Jg5SkhtFkviXlgwv6sIaRTf1ovnvx81AcfezLJo32sbRl8RnETb9EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fEHyo+s+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fEHyo+s+"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C3B42EC;
	Thu, 17 Sep 2026 10:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789632176;
	bh=3qEomJY3fM8Nt+pslnkVMCCgt97tG0uoUSvnvVNUdhs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fEHyo+s+crlkXRUSrAxS4mYwmdI9jWUNownpWc+R4VJLnzjbCs5YvpxDDaQSMIYyX
	 kvwCnvBylWQFgQpnX0lyP7iZ6gxusRb07Au1caQAuzSyaBuuqW3bWystdwffrJH3pV
	 lLknCryzlW7leE/MMsODmp9FoV8/YWB4Ys3Twp+8=
Message-ID: <f37bf06a-3563-46fd-b864-b196ffbecc23@ideasonboard.com>
Date: Thu, 17 Sep 2026 11:04:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] Rework frame descriptors
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <8733w1nqxr.fsf@kernel.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <8733w1nqxr.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mattijs, Sakari,

On 26/08/2026 12:58, Mattijs Korpershoek wrote:
> Hi Sakari,
> 
> Thank you for the series.
> 
> On Mon, Aug 24, 2026 at 15:14, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> 
>> Hi folks,
>>
>> This smallish set makes frame descriptors dynamically allocated and
>> implements a single-entry frame descriptor based on the device's format,
>> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
>> do not obtain their frame descriptor from upstream are converted. The
>> helper also obtains a frame descriptor for the desired type (parallel or
>> CSI-2) and checks there's at least one entry there. These checks are
>> removed from drivers that currently perform them. (Some drivers also check
>> there's exactly a single frame descriptor entry but I think in most cases
>> this check could be loosened. That could be done after this set.)
>>
>> More formats can be added to df-to-mbus conversion as needed. These are
>> meant to be initial formats that are enough for typical raw sensors (and
>> one RGB format, too).
>>
>> In the long run this information should probably reside in sub-device
>> state. This set however avoids having all receiver drivers to work with
>> sub-device drivers (~ 100 of such exist) that have a single stream and so
>> do not implement get_frame_desc() op.
> 
> With this series, I could sucessfully run a capture using a TI AM69-SK
> with the Arducam FPD V3Link[1] using the following device tree overlays:
>      ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
I haven't tested, but I'm a bit surprised if it works. The series misses 
converting ds90ub960.c, which has custom frame desc code, passing 
uninitialized v4l2_mbus_frame_desc to the callee, and never freeing 
anything.

I guess the leak doesn't happen with "normal" number of streams, and the 
uninitialized fields don't happen to hit anything.

  Tomi

