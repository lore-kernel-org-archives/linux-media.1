Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF343E085
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695682; cv=none; b=PEN/xAc9I+pEVXP8kaLMRVn7fwrCB/D+i45ll08B16LVXu8HYbvrCb1w0gF5eRVmw1lI7qkwkeOX+7bUBGizED/YpiyTflzxXi77mFMglJKxfa7R2lARuTOgxEYkeg3Sp0+vde5814D4m8+SltkduvF3QydIM9XO1agSTFXItrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695682; c=relaxed/simple;
	bh=NVh6FFKluaa57On52rHMQBJJBTxbbG0KE8IIPS+Ouao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8nO6CFYVFjWBkyhjG6KZwCKKKQG0VO7OIj0wuvS76AyDJQsJNVUvs6qzf7BGJqPRbz2iS+acwNLtMgEAYgx1QLcG3P9PdXETWz0KwO/ecvbcJq5ar8IIlkZXU4kNhXRYjG9yPnnVRnGxEsHzMftu1lvoNCXXt5zDWx2Kxgz8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FrmoaZak; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FrmoaZak"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 409DB1044;
	Fri, 14 Aug 2026 10:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786695591;
	bh=NVh6FFKluaa57On52rHMQBJJBTxbbG0KE8IIPS+Ouao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FrmoaZak9cvYQr+UgLIQefPLvxUoAR5YI/I2Dn04TbYikTLbrUJ4jzUL4tpYcbPIq
	 +OtQCJpEk42xingRJC54xd+APz0B4D41EywzvaEhCwcDv+iBxB8rO1S0oIArLiSfIH
	 FQmzPGFOYzoajdMU7VA6ZcZ80fzKG5VPqlCNqMSw=
Message-ID: <2b31cfaf-82ca-4585-b7c8-41a15e5dcc91@ideasonboard.com>
Date: Fri, 14 Aug 2026 11:21:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Frank Li <Frank.li@nxp.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <87pkzl15fs.fsf@kernel.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <87pkzl15fs.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2026 11:17, Mattijs Korpershoek wrote:
> Hi Sakari,
> 
> Thank you for the series.
> 
> On Mon, May 18, 2026 at 19:43, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
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
>> On callee side these patches introduce no changes as the number of
>> pre-allocated memory for 8 frame descriptors remains as-is. The
>> get_frame_desc() pad op can return more than 8 frame descriptors by
>> setting the num_entries to the desired number and returning -ENOSPC.
>>
>> If people prefer using cleanup.h / __free() to release the dynamically
>> allocated array (I think I'd almost require that), I'll merge the
>> now-separate __v4l2_subdev_get_frame_desc() into
>> v4l2_subdev_get_frame_desc().
>>
>> More formats can be added to df-to-mbus conversion as needed. These are
>> meant to be initial formats that are enough for typical raw sensors (and
>> one RGB format, too).
> 
> I've tried this out on a AM69-SK with the Arducam FPD V3Link[1] using
> the following device tree overlays:
>    ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
> 
> See TI's documentation about this [2]
> 
> I (naively) assumed that this series would replace Tomi's patch [3], but
> it did not. I see the following in dmesg:
> 
> [  286.686574] cdns-csi2rx 4504000.csi-bridge: collect_streams: "cdns_csi2rx.4504000.csi-bridge":1: found 0x1 enabled 0x0
> [  286.686754] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
> [  286.700147] ds90ub960 7-0030: Failed to get source frame desc for pad 0
> [  286.712679] j721e-csi2rx 4500000.ticsi2rx: enable streams "ds90ub960 7-0030":4/0x1
> [  286.712684] ds90ub960 7-0030: collect_streams: "ds90ub960 7-0030":4: found 0x1 enabled 0x0
> [  286.712690] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
> [  286.725884] j721e-csi2rx 4500000.ticsi2rx: enable streams 4:0x1 failed: -515
> 
> Here is my camera topology:
> https://paste.debian.net/hidden/7f56f635
> 
> I also made the following patch to attempt to convert over j721e-csi2rx:
> https://paste.debian.net/hidden/314f9c32
> 
> Is this series indeed aimed to replace all sensor-specific
> implementations of .get_frame_desc() or are patches such as the one send
> from Tomi [3] still useful?
I don't remember the details anymore, but probably related to my comment 
in this thread:

"It also looks like you only modified platform drivers. Did you check 
the i2c drivers? Some call get_frame_desc().". So I think ub953 is 
missing the conversion to v4l2_subdev_get_frame_desc().

  Tomi

