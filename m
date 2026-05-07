Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F22C3261
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170931; cv=none; b=HHe30IwMeaLX/K3w2X+DPLlUzLKTxFs0J/d1D7EXRmblh28kaIIAiF4GEpJutwd96DigWgZbG3P3xh7uSWRsKGzCMDexcHY7Pu0SNtZlgyryvBGfOP6G/I0hD4RixXZbt0wSLNQo6uXqgqqLz43ZaGgHonPHwZuLAMAAAontGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170931; c=relaxed/simple;
	bh=m8ag2rlQYyN+RHpJM2aN2wUNHOx7mJz5lq622IkxQTE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=H4zMBEqvEo3Pv/rU8vcYssBUbH3CWRw44SXFAelw6OBXb414PptOApZTJiRKZAqjn+A4EHO9T+lrDZLGaJqkIxzUTHmAZLgACdBCCSOYz8TSS+WxQXCAPP7fVIUVV2v5TO1dvHpirNQDWXUzsAWzFpNT5bmPMS7fWn+nymw/MtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.144.190) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 7 May 2026
 19:22:05 +0300
Message-ID: <460114e8-836a-41a2-b37e-994b7932dffe@auroraos.dev>
Date: Thu, 7 May 2026 19:22:04 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-ctrls-request: add NULL check in,
 v4l2_ctrl_request_complete()
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Fedor Pchelkin <pchelkin@ispras.ru>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, <lvc-project@linuxtesting.org>
References: <6a4bc954-17ec-4633-a4e2-72906e18c1ba@auroraos.dev>
 <20260507183639-76b05beba77cab2faa866272-pchelkin@ispras>
 <a29d5a17-3e3e-451a-b366-e0213d3ed9ad@auroraos.dev>
Content-Language: en-US
In-Reply-To: <a29d5a17-3e3e-451a-b366-e0213d3ed9ad@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 5/7/26 7:18 PM, Sergey Shtylyov wrote:
[...]

>>> If CONFIG_MEDIA_CONTROLLER is undefined, media_request_object_find() will
>>> always return NULL, so its 2nd call in v4l2_ctrl_request_complete() would
>>> fail as well as the 1st one and thus cause hdl to have a wrong value (at
>>> the top of memory) and list_for_each_entry() to iterate over the garbage
>>> data located there. Add NULL check for the 2nd call and place the error
>>> cleanup at the end of v4l2_ctrl_request_complete()...
>>
>> another way may be to modify the stub version of
>> media_request_object_bind() to e.g. return -EINVAL instead of 0.  Thus
> 
>    You mean ERR_PTR(-EINVAL)? Because it returns a pointer now. :-)

   Ah, I was looking at the wrong function. Sorry! :-)

[...]

MBR, Sergey
