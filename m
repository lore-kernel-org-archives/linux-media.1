Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618902;
	b=t8Qk+It3Tf1EHZ3HgpnPFidkQdkZfLzGeGaFUONPx8Dcuh++b6ULQqAQEvcXihUHuARQ
	 hugkfI6bSJvhCMSsb7eXJPetk+fba277i+4GW9f+tNc133iY37S+h1lNoz9WmZLZ3pZLH
	 VQx+9Zn4ediRsFDWh5XlXS8eo92/55fSyFIdKVxZBKd1i2wa00/Anf0nlbWruIC4uMFDL
	 +fa+qvjqRr/9kmI9DrML2eYNbH7bz2x9JGubNqRUw1zCb/RpJA5v17/kEQvHSeh6VrcA3
	 pPVesd0/So7HoLNFMjmEjDpD2KmTJ8E/68CJR/AESqGdjt90yZwB6Gl6q6pWtCdJRrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618902;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aIuTXsyHn8ihH8XctHnEFTJmZ5RrcxG5CvKa2c6OoKQ=;
	b=cbGXzq3I/atxxqV2RGN9QqYfZ5JOPc37Vzk5daOTCGGpz4d5811cFUsNtWaCecc7JiDr
	 KaNdWDDk7nw15DgA+LMFmMFJoEieAkK/dRKxBLcM2A+CR7TVTOOwpIqWOw183mHScFF2p
	 IypQrPfmhBsZB6VCLiBTAKDGcMHmv43SJW60eLuCzjHpKLmD2jBC88XO0OM8/Aq9McKNi
	 R3Z2BolmgmrZDfoPhXrWC7cgPmKBVPxfRMtyiPUKVEy+JnPFcfih8Vevo+NBLZkp4JEAU
	 jYAdUAFJuAwo62TEW7eoNXVM9NDKytv5oVjJOeq5S+2Cj4Hn7WncgrvoSgUhseMUhww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hKTQke3g;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB3606A32D
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 11:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AB3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hKTQke3g
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 387CEBE;
	Mon,  2 Nov 2026 12:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793618763;
	bh=jVlSgTI/aCwhIEJiTK3f6g78ldwsCruOjjKeNYHsaAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hKTQke3gMm1I9i1olKx7yx6xPZ9A3GePN70oCW8zyycKT3Zb6bWEvWpIZmouVYNrm
	 gWJb2bqIpxk5e0PYa0S4MpcNtN2vr2Xe8c1TbrOj0dsgqVKn4Gn2wIsHWGKMCkZOa1
	 4lxrUAN0kVkI+IlIMiPiqyObMS2xBmR9vCcH9P8w=
Message-ID: <f96d2a22-5916-4aa9-b2e1-9a5ebd78c5c3@ideasonboard.com>
Date: Mon, 2 Nov 2026 13:28:16 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] gpu: drm: omapdrm: call cec_s_phys_addr only if
 EDID is present
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
References: <cover.1793615824.git.hverkuil+cisco@kernel.org>
 <d58e8dbe49a0af87e2e98463d620e33a8115c109.1793615824.git.hverkuil+cisco@kernel.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <d58e8dbe49a0af87e2e98463d620e33a8115c109.1793615824.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/11/2026 12:36, Hans Verkuil wrote:
> If an EDID is present, then call cec_s_phys_addr. If not, then
> call cec_phys_addr_invalidate. This helps the CEC framework differentiate
> between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an EDID without
> a Physical Address.
> 
> This driver is one of the few that was doing this inconsistently.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 7 +++----
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c | 5 +++++
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h | 5 +++++
>   3 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

