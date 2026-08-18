Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFD332637
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 20:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086455; cv=none; b=YquBu8kWD+PsGYx11n/KAt4C7zENJmfBDaydf7Q+ehpBStvwsA6OY4q9hcEXG63rMn4jdb7GQ5Y5JtlunpGajdrDaSeAVBAMs90w9PfFWaRI4aqVY+GEdCLP0hNZxU0rk8ArlQXYWNQ8Qos19ubCNRiLLQ7BsBZTmqBMKORJnAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086455; c=relaxed/simple;
	bh=hAjSqn5ZTdpzNCEk8a/sq+FlI0LJOesWqhXOPXkjhiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sg7mTdUgmXe0XX0IJsHAEH3SKsmVPKZz5CmE2T3Z6V3Evi05qfZiHMM4AyUfwrVIdp0ydLdByhkIwfv+xkdOXl75QsG2LAskA18mmPCjnB3heQAK+iPhVEZ3XrcacWz0iK2eQkYYOnArP2O5q5U8QuYcgr0A3fJaZGdUmQW7Gjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (91.79.33.236) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 18 Aug
 2026 23:54:05 +0300
Message-ID: <22a378b1-b524-48ee-82c4-e42942e62a07@auroraos.dev>
Date: Tue, 18 Aug 2026 23:54:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rc: rc-ir-raw: drop useless decrements in
 ir_raw_gen_{manchester,pl}()
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>
References: <20260818203832.46030-1-s.shtylyov@auroraos.dev>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <20260818203832.46030-1-s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 8/18/26 11:38 PM, Sergey Shtylyov wrote:

> In ir_raw_gen_{manchester,pl}(), the paremeter max is usually decremented

   Oops, s/paremeter/parameter/... :-)

> while checking it for 0 but sometimes that action seems fruitless as max
> isn't used afterwards -- drop the useless decrement operators...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>[...]

MBR, Sergey

