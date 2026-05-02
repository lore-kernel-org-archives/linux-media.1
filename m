Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D628AAEB
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777740762; cv=none; b=QcaXZdrBXt0lTnHbUzsCsf92Aea0fvhK/8m+oUyqfj601DsJ0E9OaK9VukQ9/Ih0zb86Q2xkxjK6V7DhvsAPBSSC1ResR8pqsSB24csItJIlg+Xt2cCzmEDn2VyXV3Cp7aNgsUXi7arz+1FHhXEvedHfocS8T29VBqcNZHQcMdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777740762; c=relaxed/simple;
	bh=CSL3BHAG/QiyH61ehWI7Ch1ogp5f28k8xM3BRB2gzMs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=T4X6htTQffOhFgcKN0TlC86P5Z6t+FqSZNMZEWkumMQ1wW2dE7nLQ/u13wOm2dUT4jcr5d7LWCRDIVVCL5owPx4jOQNk91iPMfVLMBhTO95wnGjlTBOy6zJjyPU4Uvl2UrqXfS8kwswl27VpfiqlX9P78wie/CT4LeMB9CF8slg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.154.178) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 2 May 2026
 19:52:34 +0300
Message-ID: <efa1d06d-38ff-4ea8-a71d-cf7cb0c2fad8@auroraos.dev>
Date: Sat, 2 May 2026 19:52:34 +0300
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
 <86646092-0268-4158-bf1c-ddda5dfda84b@auroraos.dev>
Content-Language: en-US
In-Reply-To: <86646092-0268-4158-bf1c-ddda5dfda84b@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 5/2/26 11:52 AM, Sergey Shtylyov wrote:
[...]

>    Oops, a stray comma got somehow added to the subject --
> do I need to resend?

   Actually, it got added as I prepared to send the patch from Thunderbird
(git send-email is broken for me again), the patch on my disk is OK... :-/

MBR, Sergey
