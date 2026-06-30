Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6140BCCC
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823981; cv=none; b=qLIuCugLnyDwl8bbvxcvi5kRy75fWK7mLcpJFeuBhywHjMZIP0nwzPy9YS3hvXZhHCLkmmSLn0whDKCRgfdFytMneqlDsxDJLD27y+N5LozQb1zYY5C0ratfp7do96ejDyZ6KI8NU/i+mrPnahujM72YQkFuCQ4c9Yl53P3hRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823981; c=relaxed/simple;
	bh=DJeK4emkOflXwjl/mac/si0g6PHw3pIUf55mgtIYcVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ro2OHy4BFBz96jbcOx4KMN7fPL85w7TsJC7muHohw7tyh2yUw5zJdMIa2ncQHcYwzkxSPCZifgqJs+/ICbc7190avn+cf+1pPTd2N5FujeITXvRki7qEUhzWMfrb2qTqB2XkWmgTv7V+H6WH6+voLLhH8dmLUPnMXZwVYGmuOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3NzVyTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3NzVyTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5ED1F00A3A;
	Tue, 30 Jun 2026 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823980;
	bh=3eFIvaKAkvwnwvhwdzZi33rTkXErjVUnJ11p2qd39jY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i3NzVyTgAcTZVw8J5cfMUpQP6hokw/WQwBKYx/BaA25NmkQxjT0Rv2h1mZeVcWjyG
	 4VYW9KoRFsKHEOr3C7FKcVBcPa7NYonFUWVJ9VnkSCzn7nNWV3iKfzuvmYDMpJaUwr
	 j9ntnowRra5SglhtzwTG6mepzCJnLLtcoT4ucrh/tgav8EkUGRTeurWfxT3s/Bjzdn
	 XNchxsf0JoSzW7T9sOotdjLIrhsgWP06ADdjKiQdXbtRcN8GcmfZs95zlO+P63khSu
	 hFHs60Rv27Lyh3gjlpcztStFpXrDGumFLkdYPgrJFwu/wFf9Y1IkdVcbqbJ6AegECw
	 mp7vqtWhz15vQ==
Message-ID: <d8523330-2094-458d-b346-5f5a195d4986@kernel.org>
Date: Tue, 30 Jun 2026 14:52:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 1/6] media: core: v4l2-async.c: unreg subdev if asc_list
 is, empty
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
 <05d38e6d-5f18-4d70-983b-1a28ddd22535@kernel.org>
 <akOW0ioLKG7WxFHH@kekkonen.localdomain>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <akOW0ioLKG7WxFHH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 12:13, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the update.
> 
> Did you notice my comment on the subject?

No, I missed that :-)

Fixed in my branch.

> 
> On Tue, Jun 30, 2026 at 12:02:53PM +0200, Hans Verkuil wrote:
>> When my em28xx USB device that uses the i2c tvp5150 driver is
>> disconnected, it crashes.
>>
>> The cause is that the tvp5150 i2c module uses v4l2_async, but
>> the em28xx driver does not since it predates v4l2_async.
>>
>> In that corner case sd->asc_list is empty, so
>> v4l2_async_unregister_subdev() never calls v4l2_device_unregister_subdev().
>>
>> Modify the code so that, if sd->asc_list is empty,
>> v4l2_device_unregister_subdev() is still called.
>>
>> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 

Much appreciated!

Hopefully once this patch series lands it will finally stop people from posting
bad em28xx patches 'fixing' the syzkaller issues due to this.

That reminds me, I need to add a:

Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>

to this series.

Regards,

	Hans
