Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6C37EFFE
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787256951; cv=none; b=VfluxuERgkHEjNTFl/a0Vq8UadGDsBULVC1Ylj5vUfAQGRSr3pkt7bvx0kOKiVObuvakcHPJl5VKwOxSDLFMnxg8Kh9b1hyZaUdXHAa4sv5MBh+vMDgCG9YdS4pv42M97K2KydYWTSJJl+0s/OwUaY88wGDqK+g87xnkbaoLC/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787256951; c=relaxed/simple;
	bh=41VIWYpeZV0pr1njayBTsayMcD3lqqrincZBJUq0BXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cGHD4CSEZS2CBezHYkhpy4gVkpgxvBInTwnffvag5PX86Z6vbd/TUZq9eQDt39r65g9Q8KPEdKNv/ardirEZEnqS/bwdBCqBqgcNTN+Vz6Zd345PTW34GYX5m5RHqG3g3EGMtQk1T1eULhY3HRSOKFoPeYC6i+GhPzVhJsPM1Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.79.14.115) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 20 Aug
 2026 23:15:43 +0300
Message-ID: <3163dd4d-5ea2-46a6-8081-c906e2fa4ed5@auroraos.dev>
Date: Thu, 20 Aug 2026 23:15:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: drop useless assignment in
 uvc_parse_format()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>
References: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 8/20/26 11:11 PM, Sergey Shtylyov wrote:

> Close to the end of uvc_parse_format(), the parameter buflen is decremented
> (again) but that statement seems pointless as buflen isn't used afterwards.
> Drop the useless assignment (gcc doesn't generate any code for it anyways).
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
    Duh, forgot to add that the patch is against the next branch of the
linuxtv.org/media.git repo!

[...]

MBR, Sergey

