Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794358626;
	b=YZ1kWfDfo3lqnH3Sl2PAhXN1Oh3U0ap7pZaGSstxhMfQDFtO3Dp/3VjsHXAOquWQJ39M
	 sqmdRaHZ9a0DpSmp1UHOhcZpRqatLX7PEzbFNuQGmXkgZh0LVj9QovAjhkAk5ju2tFw4O
	 aAv6IlxtlW1V7dTXqliEWMyWrprJixk1whIZHyjpvL+cVsueE3aekk8DWqHgPObSuzCA0
	 CSR63RL1ZtW3MkZGdofWlZT10fGb9PHZt615aH2AzIOgg6l+zZvkIEd0iKLqNVicTJ+io
	 6BJLpsVeatEuYLuEcoELqcuWkbwRF2OqP9QWpcLyCk76fs6JQ6QrU4jl5F/hACx5SWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794358626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yiKuo8XiHGZbGLQTvMzCv4TDV6gtZYRHfBfU4L7mPHQ=;
	b=AiCTXGw/Z5VQF+n+diw8CT6T50TWg2rZ2N/p5Dm633JBLdcvd6VBrqUW1tbJh6uENAla
	 ECISrg313EcxOmjWBqhsESQG3CYfQZI/E+VvrGjSJYmwAWujV4CrKLWSWaClWDSkVAyTY
	 YgTLNReljSlbmLAdHGa3xpic0X1nsYLaNCSEPDfA8GAfbOiJU/xVvjUUmOBsHx3tNAGqe
	 pMVSvaWLaRCiN83xAaNVxYaWHsPQVOqZLwoUtzVO4DqOhGQt1s/iXzFE3rE0KdAxYUBAL
	 uZmQf8bLKSYJdIoxQaX5ofxcrB4yXODLTZmVjZhogEudNL9OByuCRNefLXYTJRzNAow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jogCD7lz;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F8D606B4A9
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F8D606B4A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jogCD7lz
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4682977f9aso338990166b.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794358625; x=1794963425; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiKuo8XiHGZbGLQTvMzCv4TDV6gtZYRHfBfU4L7mPHQ=;
        b=jogCD7lzVyUCtowhrydRmQhNcp6cYxHzk/xxgv/qgJiCj3wn22LqZgTBj8psOr7Sb1
         JpiyTTf0xbKgnyDBoeA78PK4rSkoNoxKr5JFdSpYAuBO4A58oHRGrQgCCqJZpExht+X1
         iWQAznxYuutbAnIlUh5ubnAjvERSynXfexxijRUXHlZLiGtcBNe6+QSc6dVPhoNyrsJa
         sCRH6agPK3mLMb4e8ycFxS2MoJ+yHBggfFyC/mrcYsMuiPF3mpArgud6UYlDdhTe9pHp
         zD9U0peab7oQEaoJeDJ4/1102lI9wclORM+NvTxlIId0Ietd/5vxveP/NPfwMEF3igDf
         kS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794358625; x=1794963425;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiKuo8XiHGZbGLQTvMzCv4TDV6gtZYRHfBfU4L7mPHQ=;
        b=vBklPUNGrmvmoAVCuVXBd9VJSGmDERs9d+4AAx9SSFCeqEDLFKvVs+oQWh4cw8sf6c
         PR6StyD6/k8rOnHvvyHAS2JDHoNc48hmMmF14kq+eBpisYdgKCdmtzBhPvYkFT77RFqQ
         o6rbQTtJmmYUmxkMO00uIIIwub3C2r4z4SIlqzeJqQIevDJ/SB8QFAxQ8+SfKdPz2Ovi
         XfT1bnXWa6ssdkM1FAwkgE7AdRU1ZBygi11Mg+QyaOm+MMyLfvOo8KUefM2H8fdEeY9K
         P67fwbrOaOt37Uvdo+F+bQy85+2+PwnbiQoPR0gm9/yprD/xYtsc729UtA2PE3UMELt7
         3ZTg==
X-Gm-Message-State: APuU4Z82zdXC7giE2Y2KegJ6QVwidY1zN3b0ROsZsNdq+JRD02W/dAGZ
	GwLrpfZ9AzRe5TPWg50RZqr4FD/c4kJFgXV9/PdTrSI0qse8VDcwN9MQ
X-Gm-Gg: AYBFou2t7d+wXZsKpwujDOOKh+U4RPpWAdZZM+4uhX2vRCi0751oUCjhP+hIbnOyqT2
	f0+meZJ2C/VRx3GAlHvqNLdBfyXBaI573zH2lpHJ6a+HQsgFSjGIatD/kIMaqLzgg7QD2AapI+P
	wsDvY3LnVjhHLy+j4ZKd/cU9Ca382AGwpT93GxkstifFosgqq4W7xaEdCwfwXvvt0c1trcH2sca
	mxp0Kkeir5JAiZjm62oWP0Etng0Fycg4MBorIMtrnue2u7jFSUec+ZgJjVjyGHxOHsDkRSFa7Ye
	naVlP7DGbIkMTo+kRen62s0/mzorK/6M1bfoKA26nbI10kEvqocGDljj7DhDCZ5DRPo9x0tUhgu
	2LEUGU+QC/HJwwgxJ7QnyBI2DCXBvyaVzT0Z91m69p5vTu7LMG6CTkhOKBMdGGtzGKKHQUSUrOt
	Gru6gjk4GUADxOLfkckNCX/iJPU9bF79Z/Qdl8vpKHN4sfHLW8FUPX0M/Vgv+l9iZy2rpfw1AQ0
	CPZ7oWNmywtMjnXpQDxMp6td20lByukAwMnu5JtJ+b3Qxj3BlIg75hT1G05ek3K9/xDGS80acUG
	255Bq+J4cySa/1VVrVHeIEvuRiwjHdIByNVi0zP8Itcv5wh+
X-Received: by 2002:a17:907:3d0a:b0:c42:4750:8d33 with SMTP id a640c23a62f3a-c5066b46008mr53840366b.28.1794358624563;
        Tue, 10 Nov 2026 16:57:04 -0800 (PST)
Received: from localhost ([188.146.174.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6916sm177361266b.7.2026.11.10.16.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:57:03 -0800 (PST)
Date: Wed, 11 Nov 2026 00:56:40 +0000
Message-ID: <179435860052.4109564.9298992817657762327@gmail.com>
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
To: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, media-ci@linuxtv.org
Subject: Re: [PATCH] media: mxl111sf: initialize state->d and fe_lock in probe
In-Reply-To: <6aeca161.99d0dbd8.3801b.50e8@mx.google.com>
References: <7cbccdb8-870c-46c4-bc61-2e40d8c4b4db@mail.kernel.org>
 <6aeca161.99d0dbd8.3801b.50e8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c03c1a14507dfaf8b856c2608f9ac216021fc222

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 6404eb74d..fc4010b6e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -431,8 +431,6 @@ static int mxl111sf_lgdt3305_frontend_attach(struct dvb_usb_adapter *adap, u8 fe
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -502,8 +500,6 @@ static int mxl111sf_lg2160_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -587,8 +583,6 @@ static int mxl111sf_lg2161_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -674,8 +668,6 @@ static int mxl111sf_lg2161_ep6_frontend_attach(struct dvb_usb_adapter *adap, u8
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -749,8 +741,6 @@ static int mxl111sf_attach_demod(struct dvb_usb_adapter *adap, u8 fe_id)
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 1 : 2;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -935,8 +925,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
 
-	mutex_init(&state->fe_lock);
-
 	if (state->chip_rev > MXL111SF_V6)
 		mxl111sf_config_pin_mux_modes(state, PIN_MUX_TS_SPI_IN_MODE_1);
 
@@ -1068,7 +1056,9 @@ static int mxl111sf_probe(struct dvb_usb_device *dev)
 {
 	struct mxl111sf_state *state = d_to_priv(dev);
 
+	state->d = dev;
 	mutex_init(&state->msg_lock);
+	mutex_init(&state->fe_lock);
 	return 0;
 }
 
