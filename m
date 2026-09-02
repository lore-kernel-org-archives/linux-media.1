Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CFA44BCBE
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347565; cv=none; b=NZsNwKOtlyZbB9uawRnZucf0g4NX+PPv7rBvA3nSfxbGktWQPx19G+OL1Rg7DwTf50i5ujl6h5BelxJv+BFrzieQ2+DVaZMeEPLEk9UOkNfwV5wIdTaR7Pa+XJHQF/KJubv84WqNoCcZr9dPQiP4HUwUyzs46vTvazKTMGMsiLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347565; c=relaxed/simple;
	bh=Vr4GvlCF2FVUKNuLZHmSdUdRqqeJ6ABC6WdufldK7ok=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k+vaootR7D6feLETwZY5M87oUVsZKBZyjGJmYPWO8mq04r3gInZca2bUs/Gsn7qq2gDmFYjhBoF8d5bMTfn+iwqvIAyfc/1hm+5rTw6eRyFW1kaNH1sA01F5LJzMdkIvvKz5D97D/sRj1OUy4xc/j/N8JZo4OQuA2Xdgontv0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj4eW7sT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj4eW7sT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9A61F00A3D;
	Wed,  2 Sep 2026 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347552;
	bh=0LRCT3eW2iSj/WYxUzacJJZ7kZBuRtwSyyjFKCEr4ok=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=dj4eW7sTbSUFTrklYYWBuQsm3NXPOPL9tMRufAZx0NyPKqZixxcZiQeAje8cG64Du
	 GtPNtMMjoPCYhfH2CFt8ikXaASdVkc6nvLtLi8rnxFoXwAvjEdQUqywzAPcmPaQXwS
	 0IlGI24vXgaBZAOjNDJNCWaIuEw4XL88C0gJNRXiJ6VWYcoGryicOFYLRoZs8oTjHn
	 +4EQNsiEoyVSMxSUaisVRBJ8dSzKrikahAUozIWxyxxDZgJC4f4jgfPXbaZJjwX6Ef
	 axyk/C2arTMxfheMHDO7g71sfGvsd5y5GDNHfX7nBiwv4h0viKRnncgbuWcpx2X8jy
	 OlpV8zO6Z94VA==
Message-ID: <75885b22-60af-4cbe-a1e7-957b04a6a067@kernel.org>
Date: Wed, 2 Sep 2026 13:12:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 11/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-12-sakari.ailus@linux.intel.com>
 <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>
 <20260810153207.GC3011310@killaraus.ideasonboard.com>
 <anrNQN93dT51kM3s@kekkonen.localdomain>
 <20260811083854.GA3120099@killaraus.ideasonboard.com>
 <ao6bHyVUrhr44eIu@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <ao6bHyVUrhr44eIu@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2026 09:51, Sakari Ailus wrote:
> On Tue, Aug 11, 2026 at 11:38:54AM +0300, Laurent Pinchart wrote:
>> On Tue, Aug 11, 2026 at 10:20:32AM +0300, Sakari Ailus wrote:
>>> On Mon, Aug 10, 2026 at 06:32:07PM +0300, Laurent Pinchart wrote:
>>>> On Mon, Aug 10, 2026 at 04:12:31PM +0200, Hans Verkuil wrote:
>>>>> On 07/08/2026 14:24, Sakari Ailus wrote:
>>>>>> Add v4l2_subdev_call_ci_state_active(), and
>>>>>> v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
>>>>>> take struct v4l2_subdev_client_info pointer as an argument. These ops
>>>>>> cannot be called using v4l2_subdev_call_state_active() or
>>>>>> v4l2_subdev_call_state_try() as the client_info argument precedes the
>>>>>> state argument.
>>>>>
>>>>> So if we have to jump through all these hoops just because the client_info
>>>>> pointer precedes the state pointer in the pad op argument list, wouldn't it
>>>>> be better to swap the order? For example by moving the client_info pointer
>>>>> as the last argument?
>>>>>
>>>>> Honestly, these macros are getting really hard to follow, and I'm not sure
>>>>> it is worth it just to keep the client_info before the state pointer. Yes, that's
>>>>> the logical order, but at the price of some very hard to read defines.
>>>>>
>>>>> Or am I missing something?
>>>>
>>>> Those are exactly the points I raised in the review of v6 :-)
>>>
>>> And my answer then was that I prefer some additional complexity on the
>>> framework side -- where we have a single implementation of this -- over
>>> pushing less than ideal APIs to all the drivers.
>>
>> I'm not convinced, but I won't make that a blocker if it's only me.
>>
>>> To give some idea, we currently have about 200 drivers implementing the
>>> set_fmt() pad op.
>>
>> Does the order of arguments really matter for drivers implementing those
>> operations ?
> 
> Each driver will implement these ops and it'll just look wrong in each of
> them. The complication here is rather minor so my preference is to keep it.
> It's already implemented, too.
> 

I agree with Laurent. I don't think the set_fmt pad op will be any less readable
if the client_info comes at the end. But if you want to follow what e.g. the
v4l2_subdev_call_ci_state_try macro does with this patch in place, then that is
an instant headache.

Regards,

	Hans
