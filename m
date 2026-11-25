Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635500;
	b=3eaozir5FLvh4FNuS0HQSQppRsXSRzH8G5drzwLZdVo1JRaBlgOhn7tKNMrHer26Qo1J
	 ikkAWNjAHzSgIQru2zQFjqnLVgfV+BRuS4PhRWyKo6babvmBicqtJRR5/oe4JO+xQbuJN
	 JEbVqRw2Ezoj5FBaSUpsoVM5T4Y7sHXKBhycaUbK1fucxvbhud1SEEX5Anm4NOjn+h6sv
	 +VaGg/GSOji/ddLd0NhhuGDViyOlJclDv583QlE/0sOFvzzJxfAxvTgjz7ipOJkiNhGH0
	 zArJhldCELD13ArCBBc9syr11C1l0S4YPgrKrMnyzRMgSEepstb5ZwlTlXD+DIXoczg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dXKYI3EJxaQV5jIHUv9yi8G36X/Qj3DOc1D0IScmz1Y=;
	b=rgHuciEKR0mGSr4u+qNs+B1CnEzgGJ0t9BaPlhxASFasEz/nR0114Qq+1Hr8HzlVt/sD
	 mQg4OGISWsA40LTyDv+aZBBnnwS12rerT7hxZ3aUrXLqrkz6Q5mnhDgU2swTE19KyYEYt
	 t25d6LQJNGkMhVRS1vyIovLdT1XBWVT3fTmJ4MD6rHNoOQU0KAEC6MYunTkgEQITwkhAK
	 D1NBi9uJ2XeNc4jfGJk5K+130BXPdKhdUmeZhfU6pn4lTa7hVbRCGyU/QvWGzIq9YcBwt
	 F4QQ4MZl9tLgGa1ldf+88oUiPQctWR3ZJqGcJU/wLy6EW0OqzLmFJCrzfml/JSdMGew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwpqHJf9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F19606A334
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F19606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwpqHJf9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso61876455e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635498; x=1796240298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXKYI3EJxaQV5jIHUv9yi8G36X/Qj3DOc1D0IScmz1Y=;
        b=MwpqHJf9Zki+TsDgpLUnfz3iPp40YjADzk8uJKW4iaX/Zwuc4txSCT2qW0hS2BEx0g
         /x3x00L9fmJk9L1f3P/+zNZgVjAK7GGPAHL9jBT+GA3jPx3nQB9eBXxZwvr3N+gnJ25E
         tpHQbwzTSIeeg5HB1JboF7LiGiPMCWAFUBCpIn17A1jiKAjPJaid+SYLvzVCGPHySIAH
         Afslz28eQ9JW3GidBgF9AKbS4Jtxw3FLREt8UnXWrX4dta9VcZnn2M9Pwcp19XNVXK+X
         wYHW9PG5er9VAQSOhaovy3hIrSQzULFNUcJhK0a29YC6TicyUh2bwN85kNEBLTxwugTk
         mxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635498; x=1796240298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXKYI3EJxaQV5jIHUv9yi8G36X/Qj3DOc1D0IScmz1Y=;
        b=BaXSf3wzB8XtvJZTYCSCxyzYeClF23O94jw2K4yQyUouEFwwuaDBZXlq/IvMO8f+R8
         ehpLwEegdlBRJu+Qmy7CnwZypQCDUinMoLgVfmHZ/teh2ChlTLyJg9YuYmlk8nJmwqyt
         jr7HLLuDZJr5zoCH8+jM3A3XJkyRmi/6NkvevSXXyE/TGh7UcGE1pqkaqD8Ys4WsoyVW
         PdTuEJ2ZApyN2/0bYvih4OZ3rjj2NKoZdX9fYgL81b4dJvpCS+qX/fYZHR0Pv7fdhDCz
         WiKMA42EXIwkYmzbBmmzHnqVAOfqqFUQgQvTEVoNwDaQM7xJgQ5P7G3U9HSLuLHlELcf
         x8zA==
X-Forwarded-Encrypted: i=1; AL+hErHCpqvLtflx0AtMHCfO73AOP441Ih1jPRmhIC0wQLJalYonlODzRGOPGxT1JAl2DQZeSaGCowRK2DbTHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/feBEHdg6BtU+uAmjibc0SePeeEoO2ctOk8zBfhScC8Xmu+86E
	+08bn0ClUmXvV/Nu+kK6n3UzYIXS4O/DiofW/rzVKI9OGS9aewUO2cc+
X-Gm-Gg: AZFdTZe1HIVBpX5ZOmuGTaPyebJGROuulGGxw3VieALyweRf/HwL8dbGra385Oc1M8A
	HuMErbVIdrmbjK1XcuyQvgAyMTmqxmB4RaA41cVH3RhhobUDxu8AtIzgQCsN0LwkemsfWKrvsST
	NpNSVbq1OrmvJ/T7/oFL+gQvGhTOD1qK2/Mk8/OWxla/Bv2iRV7xiIvfy7QXcS5KX90n1tmnLSP
	yNOVlBTeXxKLNkH4Iia1YZqWusZrBdhKirrkLijwDZo/+pEJveeZnaR6Ihuw4Yjesk+DZJcMzV3
	tsAu6YXewlhucUGEPPD/+X7N1FJyBoV86E3APHnrxjO4HttZPtj4Uh/NhmrlDJloFyPxPfL+JQv
	G48zsx4wGAtruFpsGPt1N0rm2/5kdMpk+tWt07pOuBKuq7eqFAkfZtWesWs2O2RUrrkRwIhwl2Q
	rgnghxRGV2jlm+fpqjY5OUA25WTqgLe984bv4DP9vzZ/EjjB83kPoSoeVdW+eJEVlf14vr8RuXa
	a/K0CA5nZe1t9MF+7Sh4GpER/OiZRdxoEl1xuPVFGRG99Xi25MftBsNtyeGod49Xhs2PkiS7mQQ
	dKkqNhZIPpeMzbnY0UXKLHqW2GYmZNiXAhwj9kVMuw==
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr366178805e9.7.1795635498187;
        Wed, 25 Nov 2026 11:38:18 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm848261515e9.14.2026.11.25.11.38.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2026 11:38:18 -0800 (PST)
Date: Wed, 25 Nov 2026 20:38:23 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kettler Christian <christian.kettler@stiftung-kifa.ch>
Cc: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Logitech BRIO (046d:085e) stops answering control requests when
 hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq for 60 s
Message-ID: <20261125203823.15fc4478.michal.pecio@gmail.com>
In-Reply-To: <2ced9c1fb45e08a94f56b0f569b01369044b5553.camel@stiftung-kifa.ch>
References: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>
	<6118ad01-65a0-4357-8118-3122479b554d@rowland.harvard.edu>
	<2ced9c1fb45e08a94f56b0f569b01369044b5553.camel@stiftung-kifa.ch>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 15:09:52 +0000, Kettler Christian wrote:
> The timeouts are not limited to the BRIO, though. During these runs
> the hub itself (VIA 2109:0824) once failed with "device descriptor
> read/all, error -110", the Realtek LAN adapter inside the hub got a
> -110 and was reset, and the hub's card reader was reset as well.
> Re-authorizing the hub (authorized 0/1) never triggers the hang, only
> physically plugging it in does. On the laptop's own ports the BRIO
> never hung (14 plugs, 4 of them on the USB-C port on the same xHCI
> controller, with the same cable and plug adapter).
> 
> So this looks like a problem with this hub rather than with the
> camera. I'm using the BRIO directly on the laptop now and consider
> this closed on my side.

Hi,

Multiple devices misbehaving could be the hub or perhaps the xHCI
controller (looks like some Intel chipset?). You could try a different
one if you have an opportunity.

Though I have no explanation why the camera works on the same port if
the hub is removed from the chain. It may be the hub after all.

Regards,
Michal
