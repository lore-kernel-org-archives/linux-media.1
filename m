Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4A3AA1B5
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716110; cv=none; b=mNhielg79vLR6wIzJPfuKfyh5HHR6iMKHJfZS1tbOq/ZNlZDouFKmrwo7IsN1Qtq93nJh4cP8DH0CzNlpOeEO1i1LQW29HIFEMgIyYJehpMTWc5H9F9+P2w1TfoYPEJ46JONp9awHQuSbVc7ujYWFwsfcGxMR1Rfu32rBYkaG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716110; c=relaxed/simple;
	bh=idVxSAugDnoWKjpJV5h6mReuywkqDVwczrOpq7HxJLU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gdwimBSWsqIKF71ulltzfgydA3jRfPxLHnQ6w78cd9pspRLeve7pXc/oKKZU7U4aEygGPBX7aXAmORw1Kn5MYqwso/lhwWJiS7iW7s9GWJ9uyrAJbWwlZAEIVXhgyliwLkF8V0ZonQ0Skzwxj2OQkDWAXMyFy9VA/AwHRGTYOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4A81F000E9;
	Mon, 29 Jun 2026 06:55:05 +0000 (UTC)
Message-ID: <390a4281-8f18-4090-bc04-c9dcedbff809@kernel.org>
Date: Mon, 29 Jun 2026 08:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv2 1/6] media: core: v4l2-async.c: unreg subdev if asc_list
 is empty
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
 <efb6cfeb1053399ebd51b83fcc4daee632281558.1781615432.git.hverkuil+cisco@kernel.org>
 <ajFogY-MkxTmiSN6@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <ajFogY-MkxTmiSN6@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2026 17:15, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jun 16, 2026 at 03:10:27PM +0200, Hans Verkuil wrote:
>> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
>> then v4l2_device_unregister_subdev() is never called, but that
>> should still happen.
>>
>> This causes crashes with em28xx that uses tvp5150: that i2c
>> module uses v4l2_async, but em28xx does not as it predates
>> v4l2_async.
>>
>> So if sd->asc_list is empty, then just call
>> v4l2_device_unregister_subdev().
>>
>> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-async.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>> index 888a2e213b08..fd0404ce9247 100644
>> --- a/drivers/media/v4l2-core/v4l2-async.c
>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>> @@ -897,7 +897,9 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>>  	kfree(sd->subdev_notifier);
>>  	sd->subdev_notifier = NULL;
>>  
>> -	if (sd->asc_list.next) {
>> +	if (list_empty(&sd->asc_list)) {
> 
> If v4l2_async_unregister_subdev() without calling
> v4l2_async_register_subdev() first, sd->asc_list.next will be NULL. That
> case needs to be handled here, too.

Ah, good point. I'll do that.

BTW, I think setting the next field of a list header to NULL is really
fragile. I would prefer to see a bool to indicate that the asc_list should
not be used (and asc_list should be an empty list in that case).

async_list.next does the same.

Also, asc_list is a poor name, way too similar to async_list. I think
async_conn_list would be much better.

Anyway, that's unrelated to this patch.

Regards,

	Hans

> 
>> +		v4l2_device_unregister_subdev(sd);
>> +	} else {
>>  		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
>>  					 asc_subdev_entry) {
>>  			v4l2_async_unbind_subdev_one(asc->notifier, asc);
> 

