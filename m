Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487308;
	b=T0Wfe5QtFToMNPhHWkvRAOm2olvXst1lpnS3n4gO+qXkA73l89UKyufWlPlOtXjP51An
	 rbF1BnZH/+JA9AWDJK9+FQuM732sTwr0XYECOe/ZWUUxnekKMDXyJCMxZvVrKKmB27r7U
	 SgM2xrA8RUVRqJgTdRkH8H9Epo1m89o8c6KBds5hyTBffc3vbUVsOdX7iB8DBNJukxO+L
	 lH26Hltaz7u0POsX4Db835KRHhiW68/Zej6ifVdjErayBakKwKUu/FbiIiaf1w9x3xw+W
	 ElGrDje5lPh4i/+/kYSgxzGkl0nIJNzYJnHZoY6y7j1MIhiPNN0T1CoKP2SbRPvpSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487308;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=E7nKWLTuHkWmlMXLh5kU5I8wRm8uXJvR4mjtegv9FYU=;
	b=cbLOxzs8bSoMQRuHUbuVIEoY98rgOTkUsltrns0GscpFnBuKgEssQxKJ3fLscQ9xpAlw
	 hZcDLZQlv/sd0mc8WpshI7ASxWVeZQ8G7Q9Jooia50F4rzlSUeSbE4KSF+aayO6vhFhR0
	 +EXV/xXqetfWV+UCyllOQTH8r6hPk+Sh3lEZ4waqsEHcW6br9jYx+hM8lCHf1C5gpIsQQ
	 qZQoLoNPDTQHIhT8XJudEgdciW7QrB/+BV2jtN8fVDN3mvsZ7EfaAADEFWaooRfmO+eEV
	 WC8gndSbSL2C1vUJY70gikmR0+8cdrfIcpnQOY8kKja3zRqeDdelFXw/qot/5SF/6MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=h7IadTmQ;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F29606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 09:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F29606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=h7IadTmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792487300; bh=/mWBO6y4uLA9kMNiJ2X7XBprWXwxrW9Qp87+frIOrU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7IadTmQN2MQKhh7hF5XBuEusaqQ9W7sjI0hX8CdgT40KGKiBGtqEG1uk9kMJXGja
	 wQP/iIMNuXsv0YgU3hAe3VxJ3ti2iSPwDfOt0DrfxrC490njpAZ3eIGZg/m6naElTC
	 M0Em7EsM91ERBVUAjes3LsVm0tZ2RyQSQW9hNg61uGfXvC3VxlFe78wixkz7G3Vd4i
	 GKubgaudwxOZKDOnl1zaETmSV0B+BMDKcSrnRaqK2ff1Uxjap2qBJelNSTBZijysEH
	 u80HI28b/iRB07E6Fh3rFngSfQY6rZbqIAeEEYkAZtN2wIyYCiX5ybE2KMS1d/ruIh
	 4pUHD0ur4roNQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 60E0240AF1; Tue, 20 Oct 2026 10:08:20 +0100 (BST)
Date: Tue, 20 Oct 2026 10:08:20 +0100
From: Sean Young <sean@mess.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: nec: Treat a full NEC command frame as a
 fresh keypress
Message-ID: <atcvhK5h_Do5SJgz@extorris.mess.org>
References: <20261020013331.251334-1-festevam@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020013331.251334-1-festevam@gmail.com>

On Mon, Oct 19, 2026 at 10:33:31PM -0300, Fabio Estevam wrote:
> NEC sends one full command frame per keypress, followed by short repeat
> frames while the button remains held. The decoder already distinguishes
> these cases and reports them through rc_keydown() and rc_repeat().
> 
> Without a toggle bit, rc-core treats a second command with the same
> scancode inside the key-up timeout as part of the existing press. The
> second tap therefore loses its key-down event. Call rc_keyup() before
> reporting each full command frame so rc-core recognizes a fresh press.
> Repeat frames still use rc_repeat() and remain unchanged.
> 
> Measured on a Ruwido Z3 over a 1.2 s hold: one command frame followed
> by 11 repeat frames. Command and repeat header spaces were 4.5 ms and
> 2.2 ms, respectively, with no overlap.
> 
> NEC remotes that repeat full command frames while held will instead
> produce press/release trains.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/rc/ir-nec-decoder.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/rc/ir-nec-decoder.c b/drivers/media/rc/ir-nec-decoder.c
> index 37b99432ad0d..4357413763ca 100644
> --- a/drivers/media/rc/ir-nec-decoder.c
> +++ b/drivers/media/rc/ir-nec-decoder.c
> @@ -153,6 +153,7 @@ static int ir_nec_decode(struct rc_dev *dev, struct ir_raw_event ev)
>  			if (data->is_nec_x)
>  				data->necx_repeat = true;
>  
> +			rc_keyup(dev);

I'm sorry, this is simply not correct. There are nec remotes which send the
full nec code (so no repeat) at least times when you press any button. As
long as the button is pressed, the code is repeated.

If you want to distinct keypresses for when a button is held down, use the
input autorepeat feature. You can adjust it with ir-keytable -D and
ir-keytable -P.

Thanks,

Sean

>  			rc_keydown(dev, rc_proto, scancode, 0);
>  		} else {
>  			rc_repeat(dev);
> -- 
> 2.43.0
> 
