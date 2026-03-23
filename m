Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05F3AC0D2
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274035; cv=none; b=eHKj5hJAmZYbacqJy94RYh4M4QuIQ6NmL+6JFZbGq+GlQ0OqG3Qes79RUXryCtTbMOSSoCdFa3huM3GIi7EtVaGNIe85sL+DrhQA3/3GD1oKrbx6yIfWDDV7EyMdhLamgQhO3GhA3fKj8WCiHl2Hynw0alrxIo2yRprjuQFlDzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274035; c=relaxed/simple;
	bh=iSrLix/vuPHgnVHsCa02rTzrdMVHv5oC5w/oIPs6zn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XzrRYzt5GAnsvhAoNPB7G1ieePmNg8hTiVNEQkD0rU1kel5V62ZsM98IbcL/TEfKv0QLEb+3rZTFU6Z/nX6FI8vw3y1XuqbhrgiyuqWD4mC6ux/UPq97v806vXUQYi4Jcwt10RfLB4nLuXHiy/04mfQSUE9dUJak0ejGPor8vjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.159.37) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Mar
 2026 16:53:43 +0300
Message-ID: <5cd44114-30ac-4de4-8a12-8a102ec851d3@auroraos.dev>
Date: Mon, 23 Mar 2026 16:53:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/5] LG Electronics LGDT3306A DVB frontend driver cleanups
To: <linux-media@vger.kernel.org>
References: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
 <69bf07c3.050a0220.8edcd.04ce@mx.google.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <69bf07c3.050a0220.8edcd.04ce@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

On 3/22/26 12:04 AM, Patchwork Integration wrote:

> Thanks for your patches! Unfortunately the Media CI robot has not been
> able to test them.
> 
> Make sure that the whole series 20260321190143.21123-1-s.shtylyov@auroraos.dev is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".

   I have explicitly said in the cover letter that this series of cleanups was done
atop of this fix [0]. I now realize that I should have probably added [RFC] to the
subjects...

[0] https://lore.kernel.org/all/20260316204455.63426-1-s.shtylyov@auroraos.dev/

[...]

MBR, Sergey

