Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33C140D577
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808343; cv=none; b=I4UYuZ3Ac/INaJUiqnyGTfQj/HXb/6l34q1aaHK1N2y2zxE837evXQOwYwTc92UcTGlUupySZI1Msahy88AsmXu8zaZs34vfxkgICaKM4AoVjvLqIAY+vSaSKnyFKoj7kLI6DRBsp5efk+t7hp0vpDmVidnzq8e3pCsG6uPtx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808343; c=relaxed/simple;
	bh=9ZbRlacCI05FcHALVgJZnR0aqeP+BdIflK9zFHlrjiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIrSW2rwubm6KdOWJN2t8OzeNt/1CQwQuusCK6S7Bo4qd2jivUccyLKYqQ831N6RF3Iqbi367L6fsxmpHfMhnXVSVyXTHGORH/S2Db6377aNosj+g/SVeIJZSOYtEVrPT7zK5f/cv0Byg9/IEu5tCwkvWCc/KlSeQtJ+EHi5IvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAe5bvgk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAe5bvgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E7F1F000E9;
	Tue, 30 Jun 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782808342;
	bh=S+qXL4cU9rGSMUbCSv5Fb9b6/YFl68okqXCgaSSrIj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LAe5bvgkGZ79nLGUgNffV22e9bwyyb1pMCppQ3B+BODjbcXYJWCJJ12+aDondkQv4
	 f7cbOhyQ/IK9JAn3WNfiXyApop0boTu7lB8Zw6XDrWKBz4pVwYQpldNRv51Qd+EkrR
	 vCE3LBjeIA8aZsAugpta1I++LCYXKk1fuHuYBxBTjyuHwg0S5cgy3XMAg15QFaH28c
	 HPahiK6cHFLo41f9V+EtN+ZXtXYQetNZEuMKhsqj9uKeRMx1GYgcidbZ+z5MvpVTIO
	 EwOmNvxPho4jFnJAvjC9VXKSOLQAU/jrgfBYXHsqVKpbAhg/bdgGpoaj1Dr/k4/N/C
	 V+0NsZW9x3v5w==
Message-ID: <3fc7cf62-c7eb-45c0-a961-af2e47f0b589@kernel.org>
Date: Tue, 30 Jun 2026 10:32:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/6] media: core: v4l2-async.c: unreg subdev if asc_list
 is empty
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
 <akN3DglbD4LPxES1@kekkonen.localdomain>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <akN3DglbD4LPxES1@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 09:58, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the patch.
> 
> On Mon, Jun 29, 2026 at 08:55:49AM +0200, Hans Verkuil wrote:
>> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
>> then v4l2_device_unregister_subdev() is never called, but that
>> should still happen.
>>
>> This causes crashes with em28xx that uses tvp5150: that i2c
>> module uses v4l2_async, but em28xx does not as it predates
>> v4l2_async.
> 
> Isn't the sub-device unregistered via v4l2_device_unregister() or do I miss
> something? em28xx_v4l2_fini() calls it.
> 
> Or do you mean the issue happens at tvp5150 unbind time?

Yes, that's when it happens. The tvp5150 driver is removed, it calls
v4l2_async_unregister_subdev(), but that never calls
v4l2_device_unregister_subdev() since em28xx doesn't use v4l2-async
and so sd->asc_list is empty.

This happens when unplugging the USB device.

> 
>>
>> So if sd->asc_list is empty, then just call
>> v4l2_device_unregister_subdev().
>>
>> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")

It was introduced by commit 28a1295795d8, before that commit this was done correctly.

Regards,

	Hans

>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-async.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index 888a2e213b08..d7437c958028 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -898,9 +898,13 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>  	sd->subdev_notifier = NULL;
>>  
>>  	if (sd->asc_list.next) {
>> -		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>> -					 asc_subdev_entry) {
>> -			v4l2_async_unbind_subdev_one(asc->notifier, asc);
>> +		if (list_empty(&sd->asc_list)) {
>> +			v4l2_device_unregister_subdev(sd);
>> +		} else {
>> +			list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>> +						 asc_subdev_entry) {
>> +				v4l2_async_unbind_subdev_one(asc->notifier, asc);
>> +			}
>>  		}
>>  	}
>>  
> 

