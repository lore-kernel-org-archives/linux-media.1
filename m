Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593448;
	b=4ZgAwEg8HEz4R+bFCNsf8ipEODqSBX5H2LNIf8zsI3jWF+26G73SmMmo7ee+2DvWmd8T
	 j4btLw+ted9Nq2DuyvfAxF+4wy6BzUpwtk4MB6bHdH/DP39IyQ7076qTsuNEEjJ+aTGjD
	 h8XKbKZ+5BuyjkVjQjGJE2ibmRJ1TjLXFhrWrNCjE9H+ZuvJFhrfAzfbPux+TuCeRsoHr
	 +8oVuCTEsozFmONuQEyRan4cxkgL7JzBTnKrzoLqve4wSPsFAztA7xP/NXJLyiehNWtCA
	 FVzCk6lCVuy2FfdZyg3SgMH82MLX8YU7RgUFo6+l1Zui41mlxHXExjxeQKKD+nYRU1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593448;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dRKFkQXIG8m+atyaMLAkOlxeVT/IHF+910joBxs1ugY=;
	b=sW8cjaM+77kvF8FK+zs31GLFW7o3MODZZf9AYuqAp6Aewk4k/xWlOP9RVHSKih6thjPF
	 NlUzSA/YyadoEvO0TPmiD6RPdicbBTtH0D+4qoAicQc3d3MWJRp6W22VGlhpaheHCNEdG
	 UU3P69QjTtG+fkKOkfYfKaJbbF9C2uUXF/SYINjEW6opnTFz5afFB16mnYNN5N5fWc5Bk
	 sYRRZxSzVz1bkaPgqDL/wdJWHPpJ5lfSc8WwCl+IA9PSB3WRPhmhgNJd1bVuJ+3Bpa9og
	 1+OSKjqO54LZYDnnGZV9wK0I7fvctZr7SW3J4PNTzINY55kP+oRYL95rjuIMbAZQjaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cThvKIUX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2D606A327;
	Wed, 25 Nov 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cThvKIUX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999411F000C6;
	Wed, 25 Nov 2026 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795593447;
	bh=dRKFkQXIG8m+atyaMLAkOlxeVT/IHF+910joBxs1ugY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=cThvKIUXt5RbRExeoZf2vOWO5eK3ixrpANH8wYZ5BgxiicLtyakgP4lZUnhYGm2uz
	 TiddNuXsbF9f6fXPFGmRpdT4JhA6qFFRP+ofJTqq6PCARmRPkcl9xNPUcnZ2yD+fp6
	 gZnLYn292ZGWeLXz1YhjxfrAo5EkobiFcyBYJ6NiLGIuAtEOkqKfCzvx3k0Ua/scZ0
	 +YIWW48RBrV/2eOTXYv3EL/37NTVh8EKL4u2sK/o+UCWBkeZh+//Hmu6U+1g6eBRWz
	 WjNcrEbQxSwFoy5HCIeGF6rNnCexkNdJM2pY5t6ZiH++4Z3R9yzBXUXNbu1IAms5Yx
	 JVZngA0kX3c/g==
Message-ID: <f8ade8c0-d967-412c-8046-96588ba0672c@kernel.org>
Date: Wed, 25 Nov 2026 08:57:25 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: i2c: cx25840: guard media_entity_cleanup() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Zixin Wang <w1355457260@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112085251.734109-1-w1355457260@gmail.com>
 <avWDGi-IPsVEdyby@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <avWDGi-IPsVEdyby@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2026 10:12, Sakari Ailus wrote:
> Hi Zixin,
> 
> On Thu, Nov 12, 2026 at 04:52:51PM +0800, Zixin Wang wrote:
>> sd->entity only exists when CONFIG_MEDIA_CONTROLLER is enabled, but the
>> two media_entity_cleanup() calls added by commit 634be628b5cc
>> ("media: i2c: cx25840-core: Add missing media_entity_cleanup()") are
>> unconditional.  Building with CONFIG_MEDIA_CONTROLLER=n therefore fails:
>>
>>   drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
>>   'struct v4l2_subdev' has no member named 'entity'
> 
> How about instead turning media_entity_cleanup() into a macro that does
> nothing with the arguments if MC is disabled?

That would be inconsistent with the way the current include/media/media-entity.h
header works.

I'll take this patch rather than changing the header.

Regards,

	Hans

> 
>>
>> Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER), matching the
>> existing media entity setup in cx25840_probe().
>>
>> The failure was reproduced with CONFIG_MEDIA_CONTROLLER=n.  After the
>> change the driver builds with both CONFIG_MEDIA_CONTROLLER=n and =y.
>>
>> AI assistance: the fix and this changelog were drafted with the Qoder
>> coding assistant; the sender reviewed the change and ran the builds.
> 
> This goes below the '---' line.
> 
>>
>> Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
>> Signed-off-by: Zixin Wang <w1355457260@gmail.com>
>> ---
>>  drivers/media/i2c/cx25840/cx25840-core.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
>> index 7066b2252afd..91794ec59e2d 100644
>> --- a/drivers/media/i2c/cx25840/cx25840-core.c
>> +++ b/drivers/media/i2c/cx25840/cx25840-core.c
>> @@ -3961,7 +3961,9 @@ static int cx25840_probe(struct i2c_client *client)
>>  		int err = state->hdl.error;
>>  
>>  		v4l2_ctrl_handler_free(&state->hdl);
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>>  		media_entity_cleanup(&sd->entity);
>> +#endif
>>  		return err;
>>  	}
>>  	if (!is_cx2583x(state))
>> @@ -3986,7 +3988,9 @@ static void cx25840_remove(struct i2c_client *client)
>>  	cx25840_ir_remove(sd);
>>  	v4l2_device_unregister_subdev(sd);
>>  	v4l2_ctrl_handler_free(&state->hdl);
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>>  	media_entity_cleanup(&sd->entity);
>> +#endif
>>  }
>>  
>>  static const struct i2c_device_id cx25840_id[] = {
> 

