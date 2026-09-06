Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4751D47AC
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 06:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675888; cv=none; b=VHOzzRml/msBLCTaM0gAcMsGQYVjnVPE0gbxGuNrWnasy8JDckNeahyMb+0noJWsPtpms13nLFJvgMuoruVnqnJMzsTh5xDNlzxcFFvS2mAelTvBu+Ob/yEXCuL6bv+eQihwXfCqUR/x5K2l9sxtCvPIe9P8GsvUKWLcnVb2TdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675888; c=relaxed/simple;
	bh=3iDz+qVS6Eg00ZJsZXSPJ+oJUmOshMviOYxD622QfAU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=kVxxamjfxmRes1FmeM1L5MNxiVNb6OPQaZll4GoqWDEbjc/tvwXjLIZgL5qUpA+ZmPYFHnoe2zZdlgXAOa9py5JaVjkxkkz78PEBLT4S8Opb9f72avNR3UgAphS8y9zW2cbdN35BdSwqiEZoNBgus+Bu62bonpfF1XwyeaH8Gy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 6866Oef0024615;
	Sun, 6 Sep 2026 15:24:40 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 6866OdVq024612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 6 Sep 2026 15:24:40 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c5a3b731-2f14-4f4d-b242-cefc9f8049a7@I-love.SAKURA.ne.jp>
Date: Sun, 6 Sep 2026 15:24:40 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: siano: fix NULL pointer dereference in
 smsdvb_media_device_unregister()
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
        Tomoki Sekiyama <tomoki.sekiyama@gmail.com>,
        linux-media@vger.kernel.org
References: <1a140bff-57f9-41b5-844e-95c7b81edacb@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <1a140bff-57f9-41b5-844e-95c7b81edacb@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav312.rs.sakura.ne.jp

On 2026/09/06 14:43, Tetsuo Handa wrote:
> If an error occurs during initialization in smsdvb_hotplug() before the
> "client->coredev = coredev;" assignment, the error unwinding path calls
> smsdvb_media_device_unregister() despite client->coredev is NULL. Fix this
> by assigning client->coredev immediately after client is allocated. Also,
> add a defensive check inside smsdvb_media_device_unregister() to return
> early if client->coredev is NULL.
> 
> Reported-by: sashiko (no mail address)
> Closes: https://sashiko.dev/#/patchset/09b616df-ea9f-4ea1-86be-ab600119f9ae%40I-love.SAKURA.ne.jp
> Assisted-by: Gemini-Pro
> Fixes: 46b1e21fe50f ("[media] siano: add support for the media controller at USB driver")
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Please ignore this patch, for sashiko found a regression
( https://sashiko.dev/#/patchset/1a140bff-57f9-41b5-844e-95c7b81edacb%40I-love.SAKURA.ne.jp ) .

