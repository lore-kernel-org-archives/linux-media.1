Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4673CF1F1;
	Fri, 14 Aug 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692022; cv=none; b=drUzPtoysj6MWjnsW3PXxKyirsRmTDeVRb4473UJl/eciZffgBDS1aG5mjcWAcDCn/3XIXka6LOClQRBtDRyekVuUZotaSH/AMuj50wHcz8bQBYbEF/c6uUUjlgql01UoA/KM/RmGT3nyckBNQUAMlL6uZkwjNG6Qh376Qv07UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692022; c=relaxed/simple;
	bh=w+WpSVw2yEnnmE3zvDptHiVgm/kYKSKeHflx6cIoAXI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cKuKxqK/DODxrXyp7UIOyWKbivyJRfLg2rHTFKSqMInu8ajm1Raw+gGF04jLBq18wMwwYEFU6mknmi4RygmUhNet780wkHibM15NJtj9VWuztPlFh22WKDLKs9xjnZl3WpZwzc8NWoDEi/jYRI+1boMpoxG6PjDzQCF2DJmTDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkcqR3iF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkcqR3iF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7202C1F000E9;
	Fri, 14 Aug 2026 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692021;
	bh=JVIVOKHCKzV9SZcORHvY1pzxe6xRMLZuTKnCtD2MggQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WkcqR3iFF0IE4Atzv+OabTALAfUhM3C/+sqOPteq1bT1a3eXWteSyshv+3FyPZ7y+
	 ef+EhY7npehhab79cQ/r5KyIDXeZ99K4iQLmPgsZ2cBM+DOG4fITjIPCE64KVHmEmJ
	 gdvdIMMbOA8/Iqf2aR/URhSzGGZZ4wEsNyZTl3AZMmxr35fWLYOLZRvKs8MVl94jlm
	 ye3SSPyUJK5S5XmiCIN2LxI4D/afpdG/7t4Ru0/usD4LRmLxRpQUzWX/tFXNi3cUpo
	 BdWwVCLXDWHT0wjeoVG5+3nZ6hX7kK/cLeX1l7Yodj293Jzr+itQi9fXCiMmd4vQcA
	 LhHSkcbgAYCgg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Mattijs Korpershoek
 <mkorpershoek@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Vaishnav Achath
 <vaishnav.a@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@linux.dev>, "Kumar,
 Udit" <u-kumar1@ti.com>
Subject: Re: [PATCH] media: i2c: imx219: Implement .get_frame_desc()
In-Reply-To: <892b7261-16b3-40f7-ae31-af9bb483a27a@ti.com>
References: <20260813-imx219-frame-desc-v1-1-2a22488a0535@kernel.org>
 <892b7261-16b3-40f7-ae31-af9bb483a27a@ti.com>
Date: Fri, 14 Aug 2026 09:20:17 +0200
Message-ID: <87v79d183y.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Yemike,

On Thu, Aug 13, 2026 at 21:12, Yemike Abhilash Chandra <y-abhilashchandra@ti.com> wrote:

> Hi Mattijs,
> Thanks for the patch.
>
> On 13/08/26 20:41, Mattijs Korpershoek wrote:
>> From: Vaishnav Achath <vaishnav.a@ti.com>
>> 
>> The next subdev in the media graph may want to enquire information such
>> as bus format, virtual channel, bus data type to route the stream from
>> this sensor correctly.
>> 
>> Add support for sharing this information using the .get_frame_desc()
>> callback.
>> 
>> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> ---
>
> FYI, similar variant of this is already posted by Tomi recently [1].

Oh, I completely missed this. I did search on lore, but not good enough,
apparently.
Thanks for the pointer.

I'm happy to drop my patch then.

>
> On that patch, quoting Sakari [2]:
>
> "I've been recently working on
> <URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
> In other words, drivers that have a single stream don't need this. We could
> probably extend that further by making use of the routing information but I
> think that should be left for later."
>
> I don't really know the status of that series. I will let Sakari to comment.

Thanks, I'll have a look!

>
> Thanks and Regards,
> Yemike Abhilash Chandra
>
>
> [1]: 
> https://lore.kernel.org/all/20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com/
> [2]: https://lore.kernel.org/all/aip-xwYlKT1d3N0S@kekkonen.localdomain/#t
>
>
