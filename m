Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422429BD8C
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777711986; cv=none; b=BF8ily8mjAcrvGfOqKeeOCuZlAv/IF0K/lA/gBrJimQABYZV6zJySbSFWhZYpJ9LsVG+I4h3uxhDY/akykl5uV4yKlv+BvgXnAeNCdtrlob5v0rRTMhfQxUjlX00dXYG5uGbrVvTTbsFFMINux4ZJ3Ez/Tae4V0JCdC+kWHmcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777711986; c=relaxed/simple;
	bh=2WbOFwvjVJ+s6eSbmsZ5XS/8vURUA4go1rWUu+AUUDc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=AnbB22xz9ycYkr19ajzecz9CIHyTJAT2KuTXCqyAsiDLJqBnXA3ScGGh4YpxBwJjQEygzcq5rWaV/hms7FyAuQz4a+5LBt2RYPwNbdYXQni0miPWX+lnstq9FsnBFBuHFOAu0EgoD+nS0igALML/inWM7kYy5YeXzU7Gtb/rWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.153.91) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 2 May 2026
 11:52:58 +0300
Message-ID: <86646092-0268-4158-bf1c-ddda5dfda84b@auroraos.dev>
Date: Sat, 2 May 2026 11:52:58 +0300
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
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, <lvc-project@linuxtesting.org>
References: <6a4bc954-17ec-4633-a4e2-72906e18c1ba@auroraos.dev>
Content-Language: en-US
In-Reply-To: <6a4bc954-17ec-4633-a4e2-72906e18c1ba@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

Hello!

   Oops, a stray comma got somehow added to the subject --
do I need to resend?

MBR, Sergey

