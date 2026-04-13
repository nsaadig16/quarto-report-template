.PHONY: preview render clean

preview:
	@echo -e "\033[33mStarting preview...\033[0m"
	docker compose -f docker-compose.preview.yml up --build

render:
	@echo -e "\033[33mStarting render...\033[0m"
	docker compose -f docker-compose.render.yml up --build
	@echo -e "\033[32mRender successfuly completed. Check the pdf in the output folder.\033[0m"
clean:
	@rm -rf .quarto .venv *.quarto_ipynb*
	@echo -e "\033[32mCleaned up!\033[0m"
