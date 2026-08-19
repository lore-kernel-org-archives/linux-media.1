Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745194779B9
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156290; cv=none; b=KijM3S0oZ/h6QWws0y01jdFsQgF6SJTLIoB7JIBf/V421BJ/0NR1z507V6Fgmz6BQELySgPxwPLzaCOpvBKvOdhscmwZG98g4IVqzS8yXbGNKGQX7C2/1E8sq6fvhB2vfmXJ/V0eW0ZR/aoHwxHPRYoTmVr2FJtJ9AMO/D9bKRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156290; c=relaxed/simple;
	bh=F4UuNC5tpdi03tsm1DYJfw+R3e1P/zKG4Uu3W/KUL+c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=dHPUiz59zlxOnQjRmz0IE8FlXZvzCYmFMdxoKUDjrlNm37b3ezm/AlIfzi7IdZSO9rGJVtc/IV4ftzN88ihYSjrO0Pmxvpv4gvfpAe+Y4aFWhD1MqYpVYLg5Pz8s6sFulmfbXfhNAQa1xYjprZtkVBxtdP6sT0Z5m7ZSRZTTsnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=nq8f817m; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="nq8f817m"
Received: from [IPV6:2a01:e0a:124b:8630:a62:66ff:fec5:ca24] (unknown [IPv6:2a01:e0a:124b:8630:a62:66ff:fec5:ca24])
	(Authenticated sender: patrick.g.mga@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id B959278035E
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 18:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787156285;
	bh=F4UuNC5tpdi03tsm1DYJfw+R3e1P/zKG4Uu3W/KUL+c=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=nq8f817m+KVakluuhd3jwyM5H7rRb6hNKHm1SFvwcyrTsNomcxzigHutZiFt/hEMl
	 8Bix+kRlAAcan+wY6TD6jbfknY6XMjTLsQTD+lpO2B11tgO/qaVGrz1c8kIstuVsgT
	 flCL+Ffqyhh29GoGht/gdEvn+/LjGvgaeHv6kRyt9TBNppGooLZ1OHY3ZJVuuFxzN4
	 5KgqOiuxRGpjL1jbqDa07nKpLow31f1OfDSEsw17PDFBtOFPANVJ8C7RoMHWpbdzw0
	 xzcT+sNiolXw+L3OB4x5Y+MzBCz2g90Ht9mZdmkx1sXFGlc6OLnuBj5Vt7osF029hA
	 RLld/usSTs/jw==
Message-ID: <b7a20e9a-9ab4-0c33-0f30-fcce361c6afc@free.fr>
Date: Wed, 19 Aug 2026 18:18:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Evolution of Hauppauge WinTV-soloHD stick
Content-Language: fr-FR
From: patrick_g <patrick.g.mga@free.fr>
To: linux-media@vger.kernel.org
References: <4f1f5a49-7a93-7096-b186-d9c73e089f91@free.fr>
In-Reply-To: <4f1f5a49-7a93-7096-b186-d9c73e089f91@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

It's not easy to make a one time message to the linux-TV team. I hope the mailing list allows message from unsubscribed origine.

Recent versions of Hauppauge WinTV-soloHD USB stick have a new ID :

     Bus 003 Device 029: ID *2040:8268* Hauppauge soloHD

and need firmware

dvb-demod-si2168-d60-01.fw

https://github.com/CoreELEC/dvb-firmware/blob/master/firmware/dvb-demod-si2168-d60-01.fw

as recent version of Hauppauge WinTV-dualHD USB stick.

Regards,

Patrick.


