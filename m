Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C332B99F
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978954; cv=none; b=ZF+q/3NJiz2ZgaD7LDh6dZpfUB1HFkZwfeUPT0YCsdziaSV0tsCXtmZiQ/zsYlbVhivCG5v0jKSVPN/QvopJjh2+k8Hh6Vv3FaM8OWXmgQslOba+hWevpFjPtLlw/nLifcbkZFNEPKb2QvjtuASPgBeXq91ZiY2N5FGbz2QjPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978954; c=relaxed/simple;
	bh=py/OqFzZ0bDAm9ZbZXZsm7yrimiSHhSM0G93nxmOReE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JwDC92JA11ogJmR5Otoww394l/y1/Ra0IuBDtjGNF0IyLUsmwtaDhefj9a68DKZenxIoldbCdUvD6R4BhgCiF/iemCBIBgb/8PGY+ZPJmsl/lny2t6Vrb5c/gZZ9M+62CL5Lp/mfNd54Jltmr/CucLnhN06sWa59DBJ05+ZbTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlSlOAsF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlSlOAsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8279C1F000FF;
	Mon, 21 Sep 2026 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789978953;
	bh=udOkCa12CkFVhK1oEuS7LvgqHitDqg/oRA1JCIYk0Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UlSlOAsFzcvLcQDIstxCIGpeQS2sHmKL/UaHtJQ0jT38/bwMBulXihuM03T1WeQv1
	 eTR8XZvGTagUk4pdwN6gwdzKHw/j+NQq2z8bcTQebNx6Kd7wwqzVDcV2VNkmcs6sga
	 KbnwWY6+xY8KNS+M3ntaaS8qFqbxYHLh/FFoemURfClomug+ZqSeW4+e1ESBI5jDVK
	 QiSwCPGstiztFW2iTXvU+fVToJQTvPlNxi4dBZsKCQwHeJSjLYL9tEx04fvV0rxy2c
	 bIqAfhV+8RvCFN2mP0b037t0zPwJZr9DnTcnYHIdDqWI8HM1PzRC52sj6Qu1EqZawh
	 9fUcKIWnCNhTA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 00/29] Rework frame descriptors
In-Reply-To: <f37bf06a-3563-46fd-b864-b196ffbecc23@ideasonboard.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <8733w1nqxr.fsf@kernel.org>
 <f37bf06a-3563-46fd-b864-b196ffbecc23@ideasonboard.com>
Date: Mon, 21 Sep 2026 10:22:30 +0200
Message-ID: <xhkdbjyofrp2x.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Tomi,

On Thu, Sep 17, 2026 at 11:04, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Mattijs, Sakari,
>
> On 26/08/2026 12:58, Mattijs Korpershoek wrote:
>> Hi Sakari,
>> 
>> Thank you for the series.
>> 
>> On Mon, Aug 24, 2026 at 15:14, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>> 
>>> Hi folks,
>>>
>>> This smallish set makes frame descriptors dynamically allocated and
>>> implements a single-entry frame descriptor based on the device's format,
>>> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
>>> do not obtain their frame descriptor from upstream are converted. The
>>> helper also obtains a frame descriptor for the desired type (parallel or
>>> CSI-2) and checks there's at least one entry there. These checks are
>>> removed from drivers that currently perform them. (Some drivers also check
>>> there's exactly a single frame descriptor entry but I think in most cases
>>> this check could be loosened. That could be done after this set.)
>>>
>>> More formats can be added to df-to-mbus conversion as needed. These are
>>> meant to be initial formats that are enough for typical raw sensors (and
>>> one RGB format, too).
>>>
>>> In the long run this information should probably reside in sub-device
>>> state. This set however avoids having all receiver drivers to work with
>>> sub-device drivers (~ 100 of such exist) that have a single stream and so
>>> do not implement get_frame_desc() op.
>> 
>> With this series, I could sucessfully run a capture using a TI AM69-SK
>> with the Arducam FPD V3Link[1] using the following device tree overlays:
>>      ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
> I haven't tested, but I'm a bit surprised if it works. The series misses 
> converting ds90ub960.c, which has custom frame desc code, passing 
> uninitialized v4l2_mbus_frame_desc to the callee, and never freeing 
> anything.
>
> I guess the leak doesn't happen with "normal" number of streams, and the 
> uninitialized fields don't happen to hit anything.

I guess I've been lucky then, in my testing.
I used a single stream, and captured 10 frames.

>
>   Tomi
