Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737628;
	b=JmhZv0rtGdj3u33R4xC72tr86Z4tEMcpqghreV4nrLtXpw5RbBg1w8VM5zGTC9SBKXmw
	 CK3pWXkjaub86cC8J90It04/p7NaRYfLFahumkEQc6dtwt7KLewoI4xWfjwDrK9bYy5AN
	 gfGsD/SllGZziKtD9InsSnwadS5w6infZkWr4xBX5bpDzs4FCzA/TN/pdILK3mCCJNXDl
	 jEOV/cZyzQgzrKh8zoPKt3wePxLAQHOpLH0F6/QHd/1vhYT3BI9YGsj/JZ/SzAibWWPAM
	 CQhlFBRuu3PvTB57oKb+ceQvck05X+pmIcxWjrG7fWG54khPQdQErMP5SJWgek9KkTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
	b=QQJyvapYiRjXRSiEgJO13n3BKVU9jys4o7iVty7zh2ci0HLkB7WSJPnlVRGhvbLMnqdK
	 76IRkM8g53E2EGAZR2UPs0XP+6V5JiU0al9c6rJHPkziH+C4+nwJtiOGZOJs+vlbFc+5M
	 ykox1haTVoQsq6FZ/b6g9U0MtSrHLCxrrbHh6J2AJm3NTM4H/KSGFRwFYhV5a36NiFVRV
	 ul4nTRYzPQe1pXdEx8C7DveaYXdIeZA71hada6q6aj6RkaWflZHXjJ3l6J/QhUa42m+q1
	 0416JVehAnMwjAPWJWsr6oUN4m/iAmqGUxcoGru56Jjpr+rQRyurb+s0E66melSyDXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEF60A3837
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DEF60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so396232f8f.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737626; x=1793342426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=D8JttAdUXWMA+C1tKErktnwsZZCy3HIUbjnaGh5X7r4L44Zk6RhL8BtNIhqkRk/36D
         IhFbmfHjF5EfcEOihgCUgXSY2+8D8PaXFo+uQ02UUPUUAw2gwAFF19tS0ABrtWDgGPoI
         HeV1vZ9M/nK1FKD6a9Az0iXO04LSuORvWofVstmgcVohmcwvPiihakPXSW2lCaaAmIrM
         44okde0ifL/bu5PZilTkScI6CcMm/uxQrgXHl4ejdowMVXSXesaaRI4KV1JkxQwpFHSe
         lbUVCuoQoCWi6cHLQQoVeoYI7ZAz+2azP2ToWhFHPNSGGzAZ6OxQW0g+zx6nEOJIwLvb
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737626; x=1793342426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=0Sn7i4rs3QABREXOL6633mPpBAd+ak1HCFdq3d/3iCBp0sqKC9XGYpX/onpTGlPD9j
         9YXVP2WcSnkXpBtGCo7KpCRLC1piCeATAvMPdaZp9XQ1/IUojXgqe1l/qvxd0GLoceaY
         FNqlOTpczqHOVhUnV/ER8e5uuiuTmp6K/Obsf4qPRE9D6G5xaLLSPlR4Gkovihtkw1f+
         styiGKPznX9VMgozVjhiBPcMdUpKETtiHOp46+xTHNKfOx+7Dd4c5JflZbrcnKpVUEF5
         Ye137Joo1SeS+W9MFkbgJyAM3CKGfDWtSizAVky6kfMb2Q7KtE3M0kiz3V7J1bQPnSS/
         tQVA==
X-Forwarded-Encrypted: i=1; AKwUvBzBVzQv27gqWeZ3esNbnBxQ3vHBdmUy9R2WdjyQgQgodMDIHtxAxti4tkIEBIT3jdiB6qkPiniYDt9XUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLUH5Q2nBWp4keIuZdy+fSnKiD9aqcIzL+fkZKlYXz//Ol19hO
	kzOoQXy/t9Igz0zDmzJLbYyfHjGhw76cL5b/uJmVHxCP7CZ3pKonUIEE
X-Gm-Gg: AYBFou1A/QPNgeEeSIn/8hS6rBfOydq1gGF/9y2dkDXh0k8JbiQIheA/d/8If1WTUWv
	jCZib1lVhmdZKEjLzgvBB0AZnYemAfA/Clguqo3ROu3AN7lOYqwKEVG88r6MtdNyO/AyjgiF2zX
	bBuY1XBgp2rMq1g3foMugIK0eyO1JPeHTR1zxEJP6Sl4SeIHu4mbbllEirNcTz+aIy7NN3at8Qn
	v55Rw7pBizPDGYI6bRlc47Nwa2OleGD0tqkP0fJ/u9o98RHmiapMTB3+QOpldaQnIHnPwiJDVyD
	ax4OvW/jB7W31v6hWAAid9LyMjZyfbOfPaDiayDhs0glOgr0p559VhFrFha4ADgFcJ4b5/eAYJd
	G1ZJO3gk9ztTDOToeiiKftxO6gGtEQGT/XA4PQ7hGWjJtyoSBekSw4l9cLavxdPTLvf8SukxY9r
	j2oTh13erlW23EOkMsbTD7Ocn1FaIjnZZJGWGpAhDtdgcaa+VmCPiVsP7rDsPEkZaw11AWa9svT
	TD5vBPSegsyvsvZkbEB0PS0xsn9ixWgiCVMSiHctdccbBiFO2AJvqaEUAfhCA5eRNhhEtibfZHf
	BRI+fdix72l426l6qWqVXm81aW3JuZMBBrCWh4CiBLk75y7H/4n0leun7FlfiT+0iEInPiE1eDp
	aZKI=
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a211eec13amr18677595e9.23.1792737626234;
        Thu, 22 Oct 2026 23:40:26 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:41 +0200
Subject: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Make sure that the timers are powered up so the firmware can use them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 611220ff2655..7639081dc913 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -166,6 +166,14 @@ &c7x_0 {
 		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	/*
+	 * Both timers on each core: core 0's firmware drives TIMER1 and core
+	 * 1's TIMER2; two entries also keep the platform bus from attaching the
+	 * domain to the K3 driver's device.
+	 */
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };
 
@@ -174,5 +182,8 @@ &c7x_1 {
 		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };

-- 
2.54.0

