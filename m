Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5F359A92;
	Fri, 20 Mar 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008483; cv=none; b=Iqg/yjXF80bXI73shYoQMWaelEedO0HID9IPHNYl5tOUFyapXiPv8gUFnY3ViH/JaCe0McjsvjbBCeTMURRNx9Buur9M4Qp72n0u+sR+emulNcGvxISWx471h97l/Mpmd7Mu0abhIfkk9UX68kHoyEf1zlBaMyY8+Y+PfyGTIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008483; c=relaxed/simple;
	bh=mzsiJI24HP+xSusrMf0u5lS56Y6+451bn++IJOeShm8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fDEkg7Lo0KxMlAmgPzA2Y2hcifd6pO6J+rB6TYaqDi0HWoOdIHZpVIUeuVbjxdM8HSy0znPeHnUn9bWqv114TM5PRTkASNAkV8KmjJRTzcNr3ak9NIsrGWb2SsULN3vlV66UdhwzOPKqWXJyVLoTFhapVCnYhKoMh8TtIqvpx2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJ1wjl4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJ1wjl4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF2EC4CEF7;
	Fri, 20 Mar 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774008483;
	bh=mzsiJI24HP+xSusrMf0u5lS56Y6+451bn++IJOeShm8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=DJ1wjl4qPGHgvTzRxlfc1UDDA6PCD/Bmyb4gc3HdkMlss70od87HDV1yFpP8vUaQ0
	 L7t/gpZDumgggNfzBG+HqkIPzh25CssGXyPSevjlLRTM/5MKaiRhm6ZFvdImx0tvBE
	 Y4a0ujqNjqgF80hFpe5KaYWtAw/daMXyDk+HxZzEw+k1JE5YSie/UDhyV07Gb+2sVV
	 ttIJXUhw9V8Lz8qoqloJhPoUngZ/kZC5Vp0C+2gXLz5tr4eidtCUM9ZCzRalaZ7LMf
	 qJkna8/1VoKcHYd5eBajA23qLyKsn6VWThZ2px0AnlrtsefIdXvADKsqnQ/BoNuNKG
	 AfNpUDhKfchcQ==
Message-ID: <3d4d9bc2-1867-417f-aa16-7a1df2aaf4f4@kernel.org>
Date: Fri, 20 Mar 2026 13:07:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH 1/2] media: em28xx-video: add the unregister of video/VBI
 entity
To: Edward Adam Davis <eadavis@qq.com>
Cc: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com,
 syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <1124bc73-d9d7-4719-b3c2-f05639d05294@kernel.org>
 <tencent_4A4977EF66743D0537DE960A36E84B4C7509@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_4A4977EF66743D0537DE960A36E84B4C7509@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2026 12:45, Edward Adam Davis wrote:
> On Mon, 16 Mar 2026 15:03:23 +0100, Hans Verkuil wrote:
>> On 11/01/2026 06:29, Edward Adam Davis wrote:
>>> When creating a media graph, a failure occurred due to the lack of
>>> a corresponding decoder. During the subsequent media device release
>>> process, the video and VBI devices were not properly unregistered,
>>> leading to a use-after-free vulnerability reported by syzbot [1].
>>>
>>> The fix involves adding the necessary unregister operations.
>>>
>>> [1]
>>> BUG: KASAN: slab-use-after-free in media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
>>> Read of size 8 at addr ffff88807c114210 by task kworker/1:9/6093
>>> Call Trace:
>>>  media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
>>>  em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
>>>  em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
>>>  em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
>>>  usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
>>>
>>> Allocated by task 5932:
>>>  em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2532
>>>  em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
>>>
>>> Freed by task 5932:
>>>  em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
>>>  kref_put include/linux/kref.h:65 [inline]
>>>  em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2901
>>>
>>> Reported-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
>>> Tested-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
>>> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
>>> ---
>>>  drivers/media/usb/em28xx/em28xx-video.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
>>> index 2dfa3242a7ab..45b68ebf2e9c 100644
>>> --- a/drivers/media/usb/em28xx/em28xx-video.c
>>> +++ b/drivers/media/usb/em28xx/em28xx-video.c
>>> @@ -882,9 +882,12 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
>>>
>>>  	for (i = 0; i < MAX_EM28XX_INPUT; i++) {
>>>  		if (!INPUT(i)->type)
>>> -			return;
>>> +			break;
>>>  		media_device_unregister_entity(&dev->input_ent[i]);
>>>  	}
>>> +	media_device_unregister_entity(&dev->v4l2->vdev.entity);
>>> +	if (em28xx_vbi_supported(dev))
>>> +		media_device_unregister_entity(&dev->v4l2->vbi_dev.entity);
>>
>> This is definitely wrong: these are registered and unregistered in v4l2-dev.c,
>> so it makes no sense to unregister them here.
> You are only half right. Under normal circumstances, these devices
> would indeed be unregistered via media_device_unregister() in v4l2-dev.c.
> However, did you notice that if em28xx_v4l2_init() fails to create
> the media graph, it will release the corresponding v4l2, including
> its members vdev and vbi_dev, before media_device_unregister() is called?
> 
> Furthermore, both vdev and vbi_dev are instances of struct video_device.
> Since they are inserted into the media framework as entities, they are,
> in essence, the corresponding video_device instances themselves (as the
> first member of struct video_device is, in fact, the entity instance).
> 
> Therefore, the UAF vulnerability described in [1] is ultimately triggered
> when media_device_unregister() attempts to remove the entity from the
> mdev instance at a em28xx usb disconnect.
> 
> Why is the execution of media_device_unregister() delayed in this context?
> There is a high probability that the open syscall acquires em28xx->lock
> *before* the unregistration path for media devices can proceed. This
> scenario is identical to the one described in patch [2]; consequently,
> this issue can also be resolved by applying the fix provided in [2].

To properly fix em28xx it has to be redesigned: all clean up would have to
be done in the v4l2_device release callback, similar to how au0282 does that.

There is no point in working around issues, without going for that approach.

The em28xx driver predates that callback, and nobody ever took the time and
substantial effort to convert it.

We regularly get patches for em28xx, but they are basically addressing symptoms
rather than the cause.

If someone wants to take on this task, then that would be great and I'm willing
to help with advice etc., but you also need to have at least some em28xx devices
to test with.

Regards,

	Hans

> 
> [2] https://lore.kernel.org/all/tencent_5DCCB375C3694964A3A5A44677775777E605@qq.com
> 
> BR,
> Edward
> 

